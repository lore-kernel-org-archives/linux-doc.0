Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F3B907D2EF
	for <lwn-linux-doc@archive.lwn.net>; Fri, 17 May 2019 07:40:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728520AbfEQHkq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 17 May 2019 03:40:46 -0400
Received: from mail.lunchkarty.eu ([80.211.141.150]:54927 "EHLO lunchkarty.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728521AbfEQHkq (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 17 May 2019 03:40:46 -0400
X-Greylist: delayed 582 seconds by postgrey-1.27 at vger.kernel.org; Fri, 17 May 2019 03:40:45 EDT
Received: by lunchkarty.eu (Postfix, from userid 1001)
        id 5BBDC877FE; Fri, 17 May 2019 09:30:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lunchkarty.eu;
        s=mail; t=1558078261;
        bh=DRu0vjHfbY7ipkVfR5IVkS8rC2tRt9/vG06AzL2xOt4=;
        h=Date:From:To:Subject:From;
        b=PsmCuY0/xOcQe4F3c2fWHRMDIAXL58SdFNjNroGRI/Fn+1xR+PKzO2AsJD+UoAfMN
         USARkzp/zoPmQH36ym4AewnDrsrsmqiEYU026mnRimmiJ7haiZiDOBpAL06F9g5EI6
         qmVh2m0j+PJvR0RIDk8879Sb3gh7c69Mrs0LnrwQ=
Received: by mail.lunchkarty.eu for <linux-doc@vger.kernel.org>; Fri, 17 May 2019 07:30:20 GMT
Message-ID: <20190517084500-0.1.11.2nmn.0.24sh3ed1n0@lunchkarty.eu>
Date:   Fri, 17 May 2019 07:30:20 GMT
From:   "Radoslav Dobrev" <radoslav.dobrev@lunchkarty.eu>
To:     <linux-doc@vger.kernel.org>
Subject: =?UTF-8?Q?=D0=92=D0=B5=D0=BB=D0=B8=D0=BA=D0=B4=D0=B5=D0=BD=D1=81=D0=BA=D0=B8_=D0=B1=D0=BE=D0=BD=D1=83=D1=81=D0=B8?=
X-Mailer: mail.lunchkarty.eu
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

=D0=97=D0=B4=D1=80=D0=B0=D0=B2=D0=B5=D0=B9=D1=82=D0=B5!

=D0=9D=D1=83=D0=B6=D0=B4=D0=B0=D0=B5=D1=82=D0=B5 =D0=BB=D0=B8 =D1=81=D0=B5=
 =D0=BE=D1=82 =D0=BC=D0=BE=D1=82=D0=B8=D0=B2=D0=B0=D1=86=D0=B8=D0=BE=D0=BD=
=D0=B5=D0=BD =D0=BF=D0=B0=D0=BA=D0=B5=D1=82 =D0=B7=D0=B0 =D0=BF=D0=B5=D1=80=
=D1=81=D0=BE=D0=BD=D0=B0=D0=BB=D0=B0, =D0=BA=D0=BE=D0=B9=D1=82=D0=BE =D0=B5=
 =D1=83=D0=B4=D0=BE=D0=B1=D0=B5=D0=BD =D0=B8 =D0=BF=D1=80=D0=B8=D0=B2=D0=BB=
=D0=B5=D0=BA=D0=B0=D1=82=D0=B5=D0=BB=D0=B5=D0=BD, =D0=BA=D0=B0=D0=BA=D1=82=
=D0=BE =D0=B7=D0=B0 =D1=80=D0=B0=D0=B1=D0=BE=D1=82=D0=BE=D0=B4=D0=B0=D1=82=
=D0=B5=D0=BB=D1=8F, =D1=82=D0=B0=D0=BA=D0=B0 =D0=B8 =D0=B7=D0=B0 =D1=81=D0=
=BB=D1=83=D0=B6=D0=B8=D1=82=D0=B5=D0=BB=D0=B8=D1=82=D0=B5?

=D0=92 =D1=82=D0=B0=D0=BA=D1=8A=D0=B2 =D1=81=D0=BB=D1=83=D1=87=D0=B0=D0=B9=
 =D0=92=D0=B8 =D0=BF=D1=80=D0=B5=D0=BF=D0=BE=D1=80=D1=8A=D1=87=D0=B2=D0=B0=
=D0=BC=D0=B5 =D0=B4=D0=B0 =D0=BE=D0=B1=D0=BC=D0=B8=D1=81=D0=BB=D0=B8=D1=82=
=D0=B5 =D0=B8=D0=B7=D0=BF=D0=BE=D0=BB=D0=B7=D0=B2=D0=B0=D0=BD=D0=B5=D1=82=
=D0=BE =D0=BD=D0=B0 =D0=B2=D1=81=D0=B5 =D0=BF=D0=BE-=D0=BF=D0=BE=D0=BF=D1=
=83=D0=BB=D1=8F=D1=80=D0=BD=D0=B8=D1=82=D0=B5 =D0=B2=D0=B0=D1=83=D1=87=D0=
=B5=D1=80=D0=B8 =D0=B7=D0=B0 =D1=85=D1=80=D0=B0=D0=BD=D0=B0 - =D1=80=D0=B0=
=D0=B1=D0=BE=D1=82=D0=BE=D0=B4=D0=B0=D1=82=D0=B5=D0=BB=D1=8F=D1=82 =D0=BE=
=D1=81=D0=B8=D0=B3=D1=83=D1=80=D1=8F=D0=B2=D0=B0 =D0=B2=D0=B0=D1=83=D1=87=
=D0=B5=D1=80=D0=B8 =D0=B7=D0=B0 =D0=BE=D0=BF=D1=80=D0=B5=D0=B4=D0=B5=D0=BB=
=D0=B5=D0=BD=D0=B0 =D1=81=D1=83=D0=BC=D0=B0, =D0=B0 =D1=81=D0=BB=D1=83=D0=
=B6=D0=B8=D1=82=D0=B5=D0=BB=D1=8F=D1=82 =D0=BC=D0=BE=D0=B6=D0=B5 =D0=B4=D0=
=B0 =D1=8F =D0=B8=D0=B7=D0=BF=D0=BE=D0=BB=D0=B7=D0=B2=D0=B0 =D0=B2 =D1=80=
=D0=B0=D0=B7=D0=BB=D0=B8=D1=87=D0=BD=D0=B8 =D0=B2=D0=B5=D1=80=D0=B8=D0=B3=
=D0=B8 =D1=85=D1=80=D0=B0=D0=BD=D0=B8=D1=82=D0=B5=D0=BB=D0=BD=D0=B8 =D0=BC=
=D0=B0=D0=B3=D0=B0=D0=B7=D0=B8=D0=BD=D0=B8 =D0=B8=D0=BB=D0=B8 =D0=B7=D0=B0=
=D0=B2=D0=B5=D0=B4=D0=B5=D0=BD=D0=B8=D1=8F =D0=B7=D0=B0 =D1=85=D1=80=D0=B0=
=D0=BD=D0=B5=D0=BD=D0=B5 =D1=81=D0=BF=D0=BE=D1=80=D0=B5=D0=B4 =D1=81=D0=B2=
=D0=BE=D0=B8=D1=82=D0=B5 =D0=BF=D1=80=D0=B5=D0=B4=D0=BF=D0=BE=D1=87=D0=B8=
=D1=82=D0=B0=D0=BD=D0=B8=D1=8F.

=D0=A9=D0=B5 =D1=81=D0=B5 =D1=80=D0=B0=D0=B4=D0=B2=D0=B0=D0=BC =D0=B4=D0=B0=
 =D0=92=D0=B8 =D0=BF=D1=80=D0=B5=D0=B4=D1=81=D1=82=D0=B0=D0=B2=D1=8F =D0=B2=
=D1=8A=D0=B7=D0=BC=D0=BE=D0=B6=D0=BD=D0=BE=D1=81=D1=82=D0=B8=D1=82=D0=B5 =
=D0=BD=D0=B0 =D0=B2=D0=B0=D1=83=D1=87=D0=B5=D1=80=D0=B8=D1=82=D0=B5  =E2=80=
=93 =D0=BC=D0=BE=D0=B3=D0=B0 =D0=BB=D0=B8 =D0=B4=D0=B0 =D0=92=D0=B8 =D1=81=
=D0=B5 =D0=BE=D0=B1=D0=B0=D0=B4=D1=8F, =D0=B7=D0=B0 =D0=B4=D0=B0 =D0=BE=D0=
=B1=D1=81=D1=8A=D0=B4=D0=B8=D0=BC =D0=B2 =D0=B4=D0=B5=D1=82=D0=B0=D0=B9=D0=
=BB=D0=B8?


=D0=A0=D0=B0=D0=B4=D0=BE=D1=81=D0=BB=D0=B0=D0=B2 =D0=94=D0=BE=D0=B1=D1=80=
=D0=B5=D0=B2
Head of HR Benefit Team
www.lunchkarty.eu 
