Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 56D587D2EF
	for <lwn-linux-doc@archive.lwn.net>; Mon, 27 May 2019 09:09:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbfE0JJE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 27 May 2019 05:09:04 -0400
Received: from mail.lunch4employee.eu ([80.211.219.151]:54028 "EHLO
        mail.lunch4employee.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbfE0JJE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 May 2019 05:09:04 -0400
X-Greylist: delayed 465 seconds by postgrey-1.27 at vger.kernel.org; Mon, 27 May 2019 05:09:04 EDT
Received: by mail.lunch4employee.eu (Postfix, from userid 1001)
        id 512D787952; Mon, 27 May 2019 11:01:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lunch4employee.eu;
        s=mail; t=1558947678;
        bh=ONuCP8WSrotnQIIUXuF9Z25xGEoxfqhSKmedy3wfW2M=;
        h=Date:From:To:Subject:From;
        b=iJzWx6RaFByHUKA7dGyBY7PgO9fhXoMkPG7+76UCWifb65o+NOkZ8vgZzZwaYpwV+
         8arZPr/lhdsP0EhJqo7C7L21hHxoRC3aRqQKRuxebaDsXZ9xBPmLbD77JoyzNU1oBT
         gypg7/++iCr1ditqhav6p/YDfGTHpclJJPOFnf4g=
Received: by mail.lunch4employee.eu for <linux-doc@vger.kernel.org>; Mon, 27 May 2019 09:01:09 GMT
Message-ID: <20190527084500-0.1.m.tr4.0.uej1r1eoq1@lunch4employee.eu>
Date:   Mon, 27 May 2019 09:01:09 GMT
From:   "Radoslav Dobrev" <radoslav.dobrev@lunch4employee.eu>
To:     <linux-doc@vger.kernel.org>
Subject: =?UTF-8?Q?=D0=9F=D1=80=D0=B8=D0=B4=D0=BE=D0=B1=D0=B8=D0=B2=D0=BA=D0=B8_=D0=B7=D0=B0_=D0=BF=D0=B5=D1=80=D1=81=D0=BE=D0=BD=D0=B0=D0=BB=D0=B0?=
X-Mailer: mail.lunch4employee.eu
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

=D0=97=D0=B4=D1=80=D0=B0=D0=B2=D0=B5=D0=B9=D1=82=D0=B5,

=D0=97=D0=B0=D0=BF=D0=BE=D0=B7=D0=BD=D0=B0=D1=82=D0=B8 =D0=BB=D0=B8 =D1=81=
=D1=82=D0=B5 =D1=81 =D0=BD=D0=B0=D0=B9-=D0=BD=D0=BE=D0=B2=D0=B0=D1=82=D0=B0=
 =D1=81=D0=BE=D1=86=D0=B8=D0=B0=D0=BB=D0=BD=D0=B0 =D0=BF=D1=80=D0=B8=D0=B4=
=D0=BE=D0=B1=D0=B8=D0=B2=D0=BA=D0=B0 =E2=80=93 =D0=B2=D0=B0=D1=83=D1=87=D0=
=B5=D1=80=D0=B8 =D0=B7=D0=B0 =D1=85=D1=80=D0=B0=D0=BD=D0=B0? =D0=90 =D0=BE=
=D0=B1=D0=BC=D0=B8=D1=81=D0=BB=D1=8F=D0=BB=D0=B8 =D0=BB=D0=B8 =D1=81=D1=82=
=D0=B5 =D0=B8=D0=B7=D0=BF=D0=BE=D0=BB=D0=B7=D0=B2=D0=B0=D0=BD=D0=B5=D1=82=
=D0=BE =D0=BD=D0=B0 =D1=82=D0=B0=D0=BA=D0=B8=D0=B2=D0=B0 =D0=B2=D0=B0=D1=83=
=D1=87=D0=B5=D1=80=D0=B8, =D1=81 =D0=BF=D0=BE=D0=BC=D0=BE=D1=89=D1=82=D0=B0=
 =D0=BD=D0=B0 =D0=BA=D0=BE=D0=B8=D1=82=D0=BE =D0=92=D0=B0=D1=88=D0=B8=D1=8F=
=D1=82 =D0=BF=D0=B5=D1=80=D1=81=D0=BE=D0=BD=D0=B0=D0=BB =D0=BC=D0=BE=D0=B6=
=D0=B5 =D0=B4=D0=B0 =D0=BF=D0=B0=D0=B7=D0=B0=D1=80=D1=83=D0=B2=D0=B0 =D0=B2=
 =D1=80=D0=B0=D0=B7=D0=BB=D0=B8=D1=87=D0=BD=D0=B8 =D0=B2=D0=B5=D1=80=D0=B8=
=D0=B3=D0=B8 =D1=85=D1=80=D0=B0=D0=BD=D0=B8=D1=82=D0=B5=D0=BB=D0=BD=D0=B8=
 =D0=BC=D0=B0=D0=B3=D0=B0=D0=B7=D0=B8=D0=BD=D0=B8 =D0=B8 =D0=B7=D0=B0=D0=B2=
=D0=B5=D0=B4=D0=B5=D0=BD=D0=B8=D1=8F?

=D0=91=D0=B8=D1=85 =D0=BC=D0=BE=D0=B3=D1=8A=D0=BB =D0=B4=D0=B0 =D0=92=D0=B8=
 =D1=81=D0=B5 =D0=BE=D0=B1=D0=B0=D0=B4=D1=8F =D0=BF=D0=BE =D1=82=D0=B5=D0=
=BB=D0=B5=D1=84=D0=BE=D0=BD=D0=B0 =D0=B8 =D0=B4=D0=B0 =D0=92=D0=B8 =D0=BF=
=D1=80=D0=B5=D0=B4=D1=81=D1=82=D0=B0=D0=B2=D1=8F =D0=B2=D1=8A=D0=B7=D0=BC=
=D0=BE=D0=B6=D0=BD=D0=BE=D1=81=D1=82=D0=B8=D1=82=D0=B5 =D0=BD=D0=B0 =D1=82=
=D0=B5=D0=B7=D0=B8 =D0=B2=D0=B0=D1=83=D1=87=D0=B5=D1=80=D0=B8 =E2=80=93 =D0=
=BC=D0=BE=D0=BB=D1=8F =D0=BF=D0=BE=D1=81=D0=BE=D1=87=D0=B5=D1=82=D0=B5 =D0=
=BA=D0=BE=D0=B3=D0=B0 =D1=89=D0=B5 =D0=92=D0=B8 =D0=B1=D1=8A=D0=B4=D0=B5 =
=D1=83=D0=B4=D0=BE=D0=B1=D0=BD=D0=BE =D0=B4=D0=B0 =D1=80=D0=B0=D0=B7=D0=B3=
=D0=BE=D0=B2=D0=B0=D1=80=D1=8F=D0=BC=D0=B5.

=D0=9F=D1=80=D0=B8=D1=8F=D1=82=D0=B5=D0=BD =D0=B4=D0=B5=D0=BD!


=D0=A0=D0=B0=D0=B4=D0=BE=D1=81=D0=BB=D0=B0=D0=B2 =D0=94=D0=BE=D0=B1=D1=80=
=D0=B5=D0=B2
Head of HR Benefit Team
www.lunch4employee.eu
