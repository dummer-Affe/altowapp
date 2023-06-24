//import 'package:flutter/material.dart';
//import 'package:go_router/go_router.dart';
//
//import '/core/init/navigation/navigation_extentions.dart';
//import '/core/init/navigation/route_page.dart';
//import '/view/login_password/view/login_password_view.dart';
//import '/view/mobile_phone_number_login/view/mobile_phone_number_view.dart';
//import '/view/success_stories/view/success_stories_view.dart';
//import '../../../view/altow_academy/view/altow_academy_view.dart';
//import '../../../view/control_panel/page_control_panel.dart';
//import '../../../view/date_of_birth/view/date_of_birth_view.dart';
//import '../../../view/home/view/home_view.dart';
//import '../../../view/jobs/view/jobs_view.dart';
//import '../../../view/login/view/login_view.dart';
//import '../../../view/otp/view/otp_view.dart';
//import '../../../view/register_email/view/register_email_view.dart';
//import '../../../view/set_password/view/set_password_view.dart';
//import '../../../view/story_detail/view/story_detail_view.dart';
//import '../../../view/ueber_uns/view/ueber_uns_view.dart';
//import '../../states/app_user/app_user.dart';
//import 'custom_transition_route.dart';
//import 'navigation_enums.dart';
//
//class RouteService {
//  final GlobalKey<NavigatorState> _rootNavigatorKey;
//  final GlobalKey<NavigatorState> _sectionNavigatorKey;
//
//  final List<RoutePage> withoutUser = [
//    RoutePage(NavigationEnums.login, const LoginView()),
//    RoutePage(NavigationEnums.loginPassword, const LoginPasswordView()),
//    RoutePage(NavigationEnums.dateOfBirth, const DateOfBirthView()),
//    RoutePage(
//        NavigationEnums.mobilePhoneNumberLogin, const MobilePhoneNumberView()),
//    RoutePage(NavigationEnums.otp, const OtpView()),
//    RoutePage(NavigationEnums.registerEmail, const RegisterEmailView()),
//    RoutePage(NavigationEnums.setPassword, const SetPasswordView()),
//  ];
//  final List<RoutePage> withUser = [
//    RoutePage(NavigationEnums.altowAcademy, const AltowAcademyView()),
//    RoutePage(NavigationEnums.home, const HomeView()),
//    RoutePage(NavigationEnums.jobs, const JobsView()),
//    RoutePage(NavigationEnums.ueberUns, const UeberUnsView()),
//  ];
//
//  RouteService.instance()
//      : _rootNavigatorKey = GlobalKey<NavigatorState>(),
//        _sectionNavigatorKey = GlobalKey<NavigatorState>();
//
//  GoRouter get router => GoRouter(
//        navigatorKey: _rootNavigatorKey,
//        initialLocation: NavigationEnums.successStories.route,
//        routes: <RouteBase>[
//          for (var route in withoutUser)
//            GoRoute(
//              path: route.page.route,
//              name: route.page.name,
//              redirect: (BuildContext context, GoRouterState state) =>
//                  AppUser.instance.isUserLogged ? "/home" : null,
//              pageBuilder: (context, state) {
//                return buildPageWithDefaultTransition(
//                    context: context, state: state, child: route.pageView);
//              },
//            ),
//          StatefulShellRoute.indexedStack(
//            builder: (context, state, navigationShell) {
//              return PageControlPanel(navigationShell);
//            },
//            branches: [
//              for (var route in withUser)
//                StatefulShellBranch(
//                  routes: <RouteBase>[
//                    GoRoute(
//                      path: route.page.route,
//                      name: route.page.name,
//                      redirect: (BuildContext context, GoRouterState state) =>
//                          AppUser.instance.isUserLogged ? null : '/login',
//                      pageBuilder: (context, state) {
//                        return buildPageWithDefaultTransition(
//                            context: context,
//                            state: state,
//                            child: route.pageView);
//                      },
//                    ),
//                  ],
//                ),
//              StatefulShellBranch(
//                routes: <RouteBase>[
//                  GoRoute(
//                      path: NavigationEnums.successStories.route,
//                      name: NavigationEnums.successStories.name,
//                      redirect: (BuildContext context, GoRouterState state) =>
//                          AppUser.instance.isUserLogged ? null : '/login',
//                      pageBuilder: (context, state) {
//                        return buildPageWithDefaultTransition(
//                            context: context,
//                            state: state,
//                            child: const SuccessStoriesView());
//                      },
//                      routes: [
//                        GoRoute(
//                          path: NavigationEnums.storyDetail.route
//                              .replaceFirst("/", ""),
//                          name: NavigationEnums.storyDetail.name,
//                          redirect: (BuildContext context,
//                                  GoRouterState state) =>
//                              AppUser.instance.isUserLogged ? null : '/login',
//                          pageBuilder: (context, state) {
//                            return buildPageWithDefaultTransition(
//                                context: context,
//                                state: state,
//                                child: const StoryDetailView(
//                                  storyID: 1,
//                                ));
//                          },
//                        )
//                      ]),
//                ],
//              ),
//            ],
//          ),
//        ],
//      );
//}
