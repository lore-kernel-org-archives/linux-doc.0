Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_NONE,URIBL_CSS,
	URIBL_CSS_A autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 83A597D8AB
	for <lwn-linux-doc@archive.lwn.net>; Mon, 20 May 2019 09:17:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729891AbfETJRL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 20 May 2019 05:17:11 -0400
Received: from mail.greatforyou.eu ([212.237.4.137]:40120 "EHLO
        mail.greatforyou.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729598AbfETJRL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 May 2019 05:17:11 -0400
X-Greylist: delayed 388 seconds by postgrey-1.27 at vger.kernel.org; Mon, 20 May 2019 05:17:10 EDT
Received: by mail.greatforyou.eu (Postfix, from userid 1001)
        id DD53187D9A; Mon, 20 May 2019 11:05:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greatforyou.eu;
        s=mail; t=1558343377;
        bh=Ose1Lf6xoZyXlmyNhvfZ0PnQ3bIpVImYbP9/NlfeECg=;
        h=Date:From:To:Subject:From;
        b=oEv6HPrJNzSzRor2owkEVQir1FQ61n7t7KPpE/5fgAdWseKSuxmpIGF+DjwkiZ2Vk
         Ct/TSVL8d6EbE791XfwFyYwj4SMVbcCA0ASli6Ck2NuqeIXZHQGyAOotdNOrb8etsl
         xlB15cPUmqu9vzJzC3wIv4mTUaie6ypr/EI8yu/k=
Received: by mail.greatforyou.eu for <linux-doc@vger.kernel.org>; Mon, 20 May 2019 09:05:03 GMT
Message-ID: <20190520110232-0.1.6.86h.0.5bliof5he5@greatforyou.eu>
Date:   Mon, 20 May 2019 09:05:03 GMT
From:   "Radoslav Dobrev" <radoslav.dobrev@greatforyou.eu>
To:     <linux-doc@vger.kernel.org>
Subject: =?UTF-8?Q?=D0=92=D0=B5=D0=BB=D0=B8=D0=BA=D0=B4=D0=B5=D0=BD=D1=81=D0=BA=D0=B8_=D0=B1=D0=BE=D0=BD=D1=83=D1=81=D0=B8?=
X-Mailer: mail.greatforyou.eu
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

=D0=97=D0=B4=D1=80=D0=B0=D0=B2=D0=B5=D0=B9=D1=82=D0=B5,

=D0=A1=D1=8A=D0=B2=D1=80=D0=B5=D0=BC=D0=B5=D0=BD=D0=BD=D0=B0=D1=82=D0=B0 =
=D1=81=D0=BE=D1=86=D0=B8=D0=B0=D0=BB=D0=BD=D0=B0 =D0=BF=D1=80=D0=B8=D0=B4=
=D0=BE=D0=B1=D0=B8=D0=B2=D0=BA=D0=B0 =D0=B2=D0=B0=D1=83=D1=87=D0=B5=D1=80=
=D0=B8 =D0=B7=D0=B0 =D1=85=D1=80=D0=B0=D0=BD=D0=B0, =D0=BA=D0=BE=D0=B8=D1=
=82=D0=BE =D0=BC=D0=BE=D0=B3=D0=B0=D1=82 =D0=B4=D0=B0 =D0=B1=D1=8A=D0=B4=D0=
=B0=D1=82 =D0=B8=D0=B7=D0=BF=D0=BE=D0=BB=D0=B7=D0=B2=D0=B0=D0=BD=D0=B8 =D0=
=B2 =D1=88=D0=B8=D1=80=D0=BE=D0=BA=D0=B0 =D1=82=D1=8A=D1=80=D0=B3=D0=BE=D0=
=B2=D1=81=D0=BA=D0=B0 =D0=BC=D1=80=D0=B5=D0=B6=D0=B0 =D0=BE=D1=82 =D1=81=D1=
=83=D0=BF=D0=B5=D1=80=D0=BC=D0=B0=D1=80=D0=BA=D0=B5=D1=82=D0=B8 =D0=B8 =D0=
=B7=D0=B0=D0=B2=D0=B5=D0=B4=D0=B5=D0=BD=D0=B8=D1=8F =D0=B7=D0=B0 =D1=85=D1=
=80=D0=B0=D0=BD=D0=B5=D0=BD=D0=B5 =D0=B2 =D1=81=D1=82=D1=80=D0=B0=D0=BD=D0=
=B0=D1=82=D0=B0, =D0=B5 =D0=B8=D0=BD=D1=81=D1=82=D1=80=D1=83=D0=BC=D0=B5=D0=
=BD=D1=82, =D0=BA=D0=BE=D0=B9=D1=82=D0=BE =D0=B5=D1=84=D0=B5=D0=BA=D1=82=D0=
=B8=D0=B2=D0=BD=D0=BE =D0=BF=D0=BE=D0=B2=D0=B8=D1=88=D0=B0=D0=B2=D0=B0 =D0=
=B5=D1=84=D0=B8=D0=BA=D0=B0=D1=81=D0=BD=D0=BE=D1=81=D1=82=D1=82=D0=B0 =D0=
=BD=D0=B0 =D0=BF=D0=B5=D1=80=D1=81=D0=BE=D0=BD=D0=B0=D0=BB=D0=B0.

=D0=98=D0=B7=D0=B1=D0=BE=D1=80=D1=8A=D1=82 =D0=BD=D0=B0 =D0=BD=D0=B0=D1=88=
=D0=B8=D1=82=D0=B5 =D0=B2=D0=B0=D1=83=D1=87=D0=B5=D1=80=D0=B8 =D0=B7=D0=B0=
 =D1=85=D1=80=D0=B0=D0=BD=D0=B0 =D0=BA=D0=B0=D1=82=D0=BE =D1=84=D0=BE=D1=80=
=D0=BC=D0=B0 =D0=BD=D0=B0 =D1=81=D0=BE=D1=86=D0=B8=D0=B0=D0=BB=D0=BD=D0=B0=
 =D0=BF=D1=80=D0=B8=D0=B4=D0=BE=D0=B1=D0=B8=D0=B2=D0=BA=D0=B0 =D1=81=D0=B0=
 =D0=B7=D0=B0 =D1=80=D0=B0=D0=B1=D0=BE=D1=82=D0=BE=D0=B4=D0=B0=D1=82=D0=B5=
=D0=BB=D1=8F =D0=BD=D0=B5 =D1=81=D0=B0=D0=BC=D0=BE =D0=BF=D1=80=D0=B8=D0=B4=
=D0=BE=D0=B1=D0=B8=D0=B2=D0=B0=D0=BD=D0=B5 =D0=BD=D0=B0 =D0=BF=D1=80=D0=BE=
=D0=B4=D1=83=D0=BA=D1=82=D0=B8=D0=B2=D0=B5=D0=BD =D0=B8 =D0=BC=D0=BE=D1=82=
=D0=B8=D0=B2=D0=B8=D1=80=D0=B0=D0=BD =D0=B5=D0=BA=D0=B8=D0=BF, =D0=BD=D0=BE=
 =D0=B8 =D0=BD=D0=BE=D1=81=D1=8F=D1=82 =D1=84=D0=B8=D0=BD=D0=B0=D0=BD=D1=81=
=D0=BE=D0=B2=D0=B8 =D0=BE=D0=B1=D0=BB=D0=B0=D0=B3=D0=B8 - =D1=81=D1=82=D0=
=BE=D0=B9=D0=BD=D0=BE=D1=81=D1=82=D1=82=D0=B0 =D0=BD=D0=B0 =D0=B8=D0=B7=D1=
=80=D0=B0=D0=B7=D1=85=D0=BE=D0=B4=D0=B2=D0=B0=D0=BD=D0=B8=D1=82=D0=B5 =D1=
=81=D1=80=D0=B5=D0=B4=D1=81=D1=82=D0=B2=D0=B0 =D0=BD=D0=B5 =D1=81=D0=B5 =D0=
=BE=D0=B1=D0=BB=D0=B0=D0=B3=D0=B0=D1=82 =D1=81 =D0=B4=D0=B0=D0=BD=D1=8A=D0=
=BA.

=D0=A0=D0=B0=D0=B4=D0=B2=D0=B0=D0=BC=D0=B5 =D1=81=D0=B5 =D0=B4=D0=B0 =D0=92=
=D0=B8 =D0=BF=D1=80=D0=B5=D0=B4=D1=81=D1=82=D0=B0=D0=B2=D0=B8=D0=BC =D0=BE=
=D1=89=D0=B5 =D0=BF=D0=BE=D0=B2=D0=B5=D1=87=D0=B5 =D0=BF=D1=80=D0=B5=D0=B4=
=D0=B8=D0=BC=D1=81=D1=82=D0=B2=D0=B0, =D0=BA=D0=BE=D0=B8=D1=82=D0=BE =D0=B1=
=D0=B8=D1=85=D1=82=D0=B5 =D0=BF=D0=BE=D0=BB=D1=83=D1=87=D0=B8=D0=BB=D0=B8=
 =D1=81 =D0=BF=D0=BE=D0=BB=D0=B7=D0=B2=D0=B0=D0=BD=D0=B5=D1=82=D0=BE =D0=BD=
=D0=B0 =D0=BD=D0=B0=D1=88=D0=B8=D1=82=D0=B5 =D0=B2=D0=B0=D1=83=D1=87=D0=B5=
=D1=80=D0=B8, =D0=BA=D0=B0=D1=82=D0=BE =D0=BD=D0=B0=D0=BF=D1=80=D0=B8=D0=BC=
=D0=B5=D1=80 =D0=BF=D0=BE=D0=BB=D0=B7=D0=B8=D1=82=D0=B5 =D0=B7=D0=B0 =D1=81=
=D0=BB=D1=83=D0=B6=D0=B8=D1=82=D0=B5=D0=BB=D0=B8=D1=82=D0=B5 =D0=92=D0=B8=
 =D0=B8 =D1=89=D0=B5 =D0=92=D0=B8 =D1=80=D0=B0=D0=B7=D0=BA=D0=B0=D0=B6=D0=
=B0 =D0=B7=D0=B0 =D0=B2=D1=8A=D0=B7=D0=BC=D0=BE=D0=B6=D0=BD=D0=BE=D1=81=D1=
=82=D0=B8=D1=82=D0=B5 =D0=BF=D1=80=D0=B8 =D1=82=D1=8F=D1=85=D0=BD=D0=BE=D1=
=82=D0=BE =D0=B8=D0=B7=D0=BF=D0=BE=D0=BB=D0=B7=D0=B2=D0=B0=D0=BD=D0=B5 - =
=D0=BC=D0=BE=D0=BB=D1=8F, =D0=BE=D0=B1=D0=B0=D0=B4=D0=B5=D1=82=D0=B5 =D1=81=
=D0=B5.


=D0=A0=D0=B0=D0=B4=D0=BE=D1=81=D0=BB=D0=B0=D0=B2 =D0=94=D0=BE=D0=B1=D1=80=
=D0=B5=D0=B2
Head of HR Benefit Team
www.greatforyou.eu
