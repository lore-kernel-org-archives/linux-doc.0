Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,URIBL_BLACK autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6EF557D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed,  6 Mar 2019 09:01:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728674AbfCFJB7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 6 Mar 2019 04:01:59 -0500
Received: from mail.best-dinner.eu ([80.211.195.231]:45738 "EHLO
        best-dinner.eu" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbfCFJB6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Mar 2019 04:01:58 -0500
X-Greylist: delayed 864 seconds by postgrey-1.27 at vger.kernel.org; Wed, 06 Mar 2019 04:01:57 EST
Received: by best-dinner.eu (Postfix, from userid 1001)
        id 2A651A19F1; Wed,  6 Mar 2019 09:37:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=best-dinner.eu;
        s=mail; t=1551861902;
        bh=+cFXDlyFRillluLJvLWbgP8O+ktvHOWUuhbgHiGmS+4=;
        h=Date:From:To:Subject:From;
        b=TI40LUSaXYfTyXtAVvrFktBtWPizTMTr5Q2/fUlcV6qxm2JvIje+46TE76iKhgy/3
         xpJ06dsFuw+8aO4RYfOYMwN5Lmlfzx0ajops5AnoIEZlmDt7Qor29K17Bxy26m0Fc9
         Dxs5LOesUTGrk0bKVMFmfKX57/6ajKl1HHvMZrLU=
Received: by best-dinner.eu for <linux-doc@vger.kernel.org>; Wed,  6 Mar 2019 08:37:15 GMT
Message-ID: <20190306084540-0.1.29.38r9.0.jdf1q9ztkb@best-dinner.eu>
Date:   Wed,  6 Mar 2019 08:37:15 GMT
From:   "Martin Adamov" <martin.adamov@best-dinner.eu>
To:     <linux-doc@vger.kernel.org>
Subject: =?UTF-8?Q?=D0=9C=D0=BE=D1=82=D0=B8=D0=B2=D0=B8=D1=80=D0=B0=D0=BD_=D0=BF=D0=B5=D1=80=D1=81=D0=BE=D0=BD=D0=B0=D0=BB?=
X-Mailer: mail.best-dinner.eu
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

=D0=97=D0=B4=D1=80=D0=B0=D0=B2=D0=B5=D0=B9=D1=82=D0=B5,
=20
=D0=92=D0=B0=D1=83=D1=87=D0=B5=D1=80=D0=B8=D1=82=D0=B5 =D0=B7=D0=B0 =D1=85=
=D1=80=D0=B0=D0=BD=D0=B0 =D1=81=D0=B5 =D0=BD=D0=B0=D1=80=D0=B5=D0=B6=D0=B4=
=D0=B0=D1=82 =D1=81=D1=80=D0=B5=D0=B4 =D0=BB=D1=8E=D0=B1=D0=B8=D0=BC=D0=B8=
=D1=82=D0=B5 =D1=81=D0=BE=D1=86=D0=B8=D0=B0=D0=BB=D0=BD=D0=B8 =D0=BF=D1=80=
=D0=B8=D0=B4=D0=BE=D0=B1=D0=B8=D0=B2=D0=BA=D0=B8 =D0=BD=D0=B0 =D1=80=D0=B0=
=D0=B1=D0=BE=D1=82=D0=B5=D1=89=D0=B8=D1=82=D0=B5 =D1=85=D0=BE=D1=80=D0=B0=
 =D0=B8 =D1=81=D1=80=D0=B5=D0=B4 =D0=BD=D0=B0=D0=B9-=D0=BF=D1=80=D0=B5=D0=
=B4=D0=BF=D0=BE=D1=87=D0=B8=D1=82=D0=B0=D0=BD=D0=B8=D1=82=D0=B5 =D0=BD=D0=
=B0=D1=87=D0=B8=D0=BD=D0=B8 =D0=B7=D0=B0 =D1=81=D1=82=D0=B8=D0=BC=D1=83=D0=
=BB=D0=B8=D1=80=D0=B0=D0=BD=D0=B5 =D0=BE=D1=82 =D1=80=D0=B0=D0=B1=D0=BE=D1=
=82=D0=BE=D0=B4=D0=B0=D1=82=D0=B5=D0=BB=D0=B8=D1=82=D0=B5. =D0=A2=D0=B5 =D0=
=BF=D0=BE=D0=B4=D0=BE=D0=B1=D1=80=D1=8F=D0=B2=D0=B0=D1=82 =D0=B5=D1=84=D0=
=B5=D0=BA=D1=82=D0=B8=D0=B2=D0=BD=D0=BE=D1=81=D1=82=D1=82=D0=B0 =D0=B8 =D0=
=BF=D1=80=D0=BE=D0=B8=D0=B7=D0=B2=D0=BE=D0=B4=D0=B8=D1=82=D0=B5=D0=BB=D0=BD=
=D0=BE=D1=81=D1=82=D1=82=D0=B0 =D0=BD=D0=B0 =D0=92=D0=B0=D1=88=D0=B8=D1=82=
=D0=B5 =D1=81=D0=BB=D1=83=D0=B6=D0=B8=D1=82=D0=B5=D0=BB=D0=B8.
=20
=D0=91=D0=BB=D0=B0=D0=B3=D0=BE=D0=B4=D0=B0=D1=80=D0=B5=D0=BD=D0=B8=D0=B5 =
=D0=BD=D0=B0 =D0=B2=D0=B0=D1=83=D1=87=D0=B5=D1=80=D0=B8=D1=82=D0=B5 =D0=B7=
=D0=B0 =D1=85=D1=80=D0=B0=D0=BD=D0=B0 =D1=80=D0=B5=D0=B0=D0=BB=D0=B8=D0=B7=
=D0=B8=D1=80=D0=B0=D1=82=D0=B5 =D1=81=D0=BF=D0=B5=D1=81=D1=82=D1=8F=D0=B2=
=D0=B0=D0=BD=D0=B8=D1=8F =E2=80=93 =D1=81=D1=82=D0=BE=D0=B9=D0=BD=D0=BE=D1=
=81=D1=82=D1=82=D0=B0 =D0=BD=D0=B0 =D0=B2=D0=B0=D1=83=D1=87=D0=B5=D1=80=D0=
=B8=D1=82=D0=B5 =D0=BD=D0=B5 =D1=81=D0=B5 =D0=BE=D0=B1=D0=BB=D0=B0=D0=B3=D0=
=B0 =D1=81 =D0=B4=D0=B0=D0=BD=D1=8A=D1=86=D0=B8 =D0=B8 =D0=BE=D1=81=D0=B8=
=D0=B3=D1=83=D1=80=D0=BE=D0=B2=D0=BA=D0=B8 =D0=B4=D0=BE 60=D0=BB=D0=B2 =D0=
=BC=D0=B5=D1=81=D0=B5=D1=87=D0=BD=D0=BE =D0=B7=D0=B0 =D0=B2=D1=81=D0=B5=D0=
=BA=D0=B8 =D1=80=D0=B0=D0=B1=D0=BE=D1=82=D0=BD=D0=B8=D0=BA, =D0=B0 =D0=B2=
 =D1=81=D1=8A=D1=89=D0=BE=D1=82=D0=BE =D0=B2=D1=80=D0=B5=D0=BC=D0=B5 =D0=BC=
=D0=BE=D1=82=D0=B8=D0=B2=D0=B0=D1=86=D0=B8=D1=8F=D1=82=D0=B0 =D0=B8 =D0=BF=
=D0=BE=D0=BA=D1=83=D0=BF=D0=B0=D1=82=D0=B5=D0=BB=D0=BD=D0=B0=D1=82=D0=B0 =
=D1=81=D0=BF=D0=BE=D1=81=D0=BE=D0=B1=D0=BD=D0=BE=D1=81=D1=82 =D0=BD=D0=B0=
 =D1=81=D0=BB=D1=83=D0=B6=D0=B8=D1=82=D0=B5=D0=BB=D0=B8=D1=82=D0=B5 =D0=BD=
=D0=B0=D1=80=D0=B0=D1=81=D1=82=D0=B2=D0=B0.
=20
=D0=90=D0=BA=D0=BE =D0=BF=D1=80=D0=BE=D1=8F=D0=B2=D1=8F=D0=B2=D0=B0=D1=82=
=D0=B5 =D0=B8=D0=BD=D1=82=D0=B5=D1=80=D0=B5=D1=81 =D0=BA=D1=8A=D0=BC =D0=B2=
=D1=8A=D0=B7=D0=BC=D0=BE=D0=B6=D0=BD=D0=BE=D1=81=D1=82=D0=B8=D1=82=D0=B5 =
=D0=B7=D0=B0 =D0=B2=D1=8A=D0=B2=D0=B5=D0=B6=D0=B4=D0=B0=D0=BD=D0=B5 =D0=BD=
=D0=B0 =D0=B2=D0=B0=D1=83=D1=87=D0=B5=D1=80=D0=B8 =D0=B7=D0=B0 =D1=85=D1=80=
=D0=B0=D0=BD=D0=B0 =D0=B2=D1=8A=D0=B2 =D0=92=D0=B0=D1=88=D0=B0=D1=82=D0=B0=
 =D1=84=D0=B8=D1=80=D0=BC=D0=B0 =D0=B8 =D0=B6=D0=B5=D0=BB=D0=B0=D0=B5=D1=82=
=D0=B5 =D0=BF=D0=BE-=D0=BF=D0=BE=D0=B4=D1=80=D0=BE=D0=B1=D0=BD=D0=B0 =D0=B8=
=D0=BD=D1=84=D0=BE=D1=80=D0=BC=D0=B0=D1=86=D0=B8=D1=8F, =D0=B8=D0=B7=D0=BF=
=D1=80=D0=B0=D1=82=D0=B5=D1=82=D0=B5 =D0=BC=D0=B8 =D1=81=D1=8A=D0=BE=D0=B1=
=D1=89=D0=B5=D0=BD=D0=B8=D0=B5.

=D0=9C=D0=B0=D1=80=D1=82=D0=B8=D0=BD =D0=90=D0=B4=D0=B0=D0=BC=D0=BE=D0=B2
=D0=BC=D0=B5=D0=BD=D0=B8=D0=B4=D0=B6=D1=8A=D1=80
www.best-dinner.eu
