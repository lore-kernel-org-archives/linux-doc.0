Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3F8DD7D2EF
	for <lwn-linux-doc@archive.lwn.net>; Mon, 27 May 2019 08:06:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbfE0IGh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 27 May 2019 04:06:37 -0400
Received: from mail.eatforyou.eu ([80.211.90.82]:41716 "EHLO mail.eatforyou.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726046AbfE0IGh (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 27 May 2019 04:06:37 -0400
X-Greylist: delayed 667 seconds by postgrey-1.27 at vger.kernel.org; Mon, 27 May 2019 04:06:36 EDT
Received: by mail.eatforyou.eu (Postfix, from userid 1001)
        id CC02E875BA; Mon, 27 May 2019 09:54:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=eatforyou.eu; s=mail;
        t=1558943719; bh=vyeMfvM9p5OpBZcpaixj7OR3/HmtYFl6oOgS3h1qK0U=;
        h=Date:From:To:Subject:From;
        b=UVKinhnuKprUEkaiFAVmOdwlZ4gOY9rcNK8xVwu7QS0ALcQbrTeYIsWy5I24cHmgl
         GeIPgSeqNfiByXxy/rvqjnklwOYi6a2DlJNXo1/90Hp3bIYnzfajPu05pZdYVgBRAJ
         JGkmuFoBnkyAb2rMsG0xy2+jjevX2nH7Y6t+oZBE=
Received: by mail.eatforyou.eu for <linux-doc@vger.kernel.org>; Mon, 27 May 2019 07:54:19 GMT
Message-ID: <20190527095339-0.1.a.mlo.0.2h1ide9fzh@eatforyou.eu>
Date:   Mon, 27 May 2019 07:54:19 GMT
From:   "Radoslav Dobrev" <radoslav.dobrev@eatforyou.eu>
To:     <linux-doc@vger.kernel.org>
Subject: =?UTF-8?Q?=D0=92=D0=B5=D0=BB=D0=B8=D0=BA=D0=B4=D0=B5=D0=BD=D1=81=D0=BA=D0=B8_=D0=B1=D0=BE=D0=BD=D1=83=D1=81=D0=B8?=
X-Mailer: mail.eatforyou.eu
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

=D0=97=D0=B4=D1=80=D0=B0=D0=B2=D0=B5=D0=B9=D1=82=D0=B5,

=D1=81=D1=8A=D0=B2=D1=80=D0=B5=D0=BC=D0=B5=D0=BD=D0=BD=D0=BE=D1=82=D0=BE =
=D0=B4=D0=BE=D0=BF=D0=BB=D0=B0=D1=89=D0=B0=D0=BD=D0=B5 =D0=BD=D0=B0 =D1=85=
=D1=80=D0=B0=D0=BD=D0=B0 =D0=BF=D0=BE=D0=B4 =D1=84=D0=BE=D1=80=D0=BC=D0=B0=
=D1=82=D0=B0 =D0=BD=D0=B0 =D0=B2=D0=B0=D1=83=D1=87=D0=B5=D1=80=D0=B8 =D0=B7=
=D0=B0 =D1=85=D1=80=D0=B0=D0=BD=D0=B0, =D0=BA=D0=BE=D0=B8=D1=82=D0=BE =D0=
=BC=D0=BE=D0=B3=D0=B0=D1=82 =D0=B4=D0=B0 =D0=B1=D1=8A=D0=B4=D0=B0=D1=82 =D0=
=B8=D0=B7=D0=BF=D0=BE=D0=BB=D0=B7=D0=B2=D0=B0=D0=BD=D0=B8 =D0=B2 =D0=BD=D0=
=B0=D0=B9-=D0=B3=D0=BE=D0=BB=D1=8F=D0=BC=D0=B0=D1=82=D0=B0 =D0=BC=D1=80=D0=
=B5=D0=B6=D0=B0 =D0=BE=D1=82 =D0=B7=D0=B0=D0=B2=D0=B5=D0=B4=D0=B5=D0=BD=D0=
=B8=D1=8F =D0=B7=D0=B0 =D1=85=D1=80=D0=B0=D0=BD=D0=B5=D0=BD=D0=B5 =D0=B2 =
=D1=81=D1=82=D1=80=D0=B0=D0=BD=D0=B0=D1=82=D0=B0, =D0=B5 =D0=B8=D0=BD=D1=81=
=D1=82=D1=80=D1=83=D0=BC=D0=B5=D0=BD=D1=82, =D0=BA=D0=BE=D0=B9=D1=82=D0=BE=
 =D0=B5=D1=84=D0=B5=D0=BA=D1=82=D0=B8=D0=B2=D0=BD=D0=BE =D0=BF=D0=BE=D0=B2=
=D0=B8=D1=88=D0=B0=D0=B2=D0=B0 =D0=B5=D1=84=D0=B5=D0=BA=D1=82=D0=B8=D0=B2=
=D0=BD=D0=BE=D1=81=D1=82=D1=82=D0=B0 =D0=BD=D0=B0 =D0=BF=D0=B5=D1=80=D1=81=
=D0=BE=D0=BD=D0=B0=D0=BB=D0=B0.

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
www.eatforyou.eu
