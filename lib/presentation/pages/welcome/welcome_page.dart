import 'package:auto_route/auto_route.dart';
import 'package:debt_tracker/core/assets/lottie_assets.dart';
import 'package:debt_tracker/generated/l10n.dart';
import 'package:debt_tracker/presentation/extensions/build_context_extensions.dart';
import 'package:debt_tracker/presentation/extensions/text_style_extensions.dart';
import 'package:debt_tracker/presentation/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class WelcomePage extends StatelessWidget implements AutoRouteWrapper {
  const WelcomePage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: kToolbarHeight + context.mediaQuery.padding.top + 32,
                left: 0,
                right: 0,
                child: Container(
                  constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.5),
                  child: Lottie.asset(LottieAssets.financeGuru),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: context.colors.surface,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                  ),
                  constraints: BoxConstraints(
                    minWidth: constraints.maxWidth,
                    maxHeight: constraints.maxHeight - context.mediaQuery.padding.top,
                  ),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      left: 56,
                      right: 56,
                      top: 32,
                      bottom: context.mediaQuery.padding.bottom + 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          S.of(context).welcome,
                          style: context.textTheme.titleLarge?.semiBold,
                          textAlign: TextAlign.center,
                        ),
                        const Gap(8),
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Text(
                              S.of(context).debtsAppName,
                              style: context.textTheme.titleLarge?.medium.withColor(
                                context.colors.primary,
                              ),
                            ),
                            Text(
                              ' - ${S.of(context).debtTrackerSubAppName}',
                              style: context.textTheme.titleLarge,
                            ),
                          ],
                        ),
                        const Gap(32),
                        FilledButton(onPressed: () {}, child: Text(S.of(context).signUp)),
                        const Gap(8),
                        FilledButton.tonal(
                          onPressed: () {
                            context.router.push(const SignInRoute());
                          },
                          child: Text(S.of(context).haveAccount),
                        ),
                        const Gap(16),
                        TextButton(
                          onPressed: () {
                            context.router.push(const HomeRoute());
                          },
                          child: Text(S.of(context).singAsGuest),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
