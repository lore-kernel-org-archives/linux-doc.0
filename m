Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C36CE7D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 15 Mar 2019 08:50:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbfCOIuK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 15 Mar 2019 04:50:10 -0400
Received: from mail.eatwithus.eu ([176.107.131.6]:54052 "EHLO eatwithus.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726898AbfCOIuK (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 15 Mar 2019 04:50:10 -0400
Received: by eatwithus.eu (Postfix, from userid 1001)
        id 4397388616; Fri, 15 Mar 2019 09:47:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=eatwithus.eu; s=mail;
        t=1552639756; bh=fWzcQlmv8qxvQK5z8oFv+qOuAGHkK6e9htUuyy6OIPw=;
        h=Date:From:To:Subject:From;
        b=p/bZ5ePuL5bc88/YNz7D57VBBeEEJSnISNg8kcmOPbv6GutdHTWUrdpx8DtKst8CO
         JCeC7oDCpTafx/73sZQIqETTeYRYJ5Cse3igWXKB6rN/A6ijiWIr4ByLPtSQTakvc5
         tcAwR4qN33dA6GPJIcma0CHw/3z8sgzeTnvF8yQM=
Received: by mail.eatwithus.eu for <linux-doc@vger.kernel.org>; Fri, 15 Mar 2019 08:47:15 GMT
Message-ID: <20190315094312-0.1.c.7ab.0.2glagllb61@eatwithus.eu>
Date:   Fri, 15 Mar 2019 08:47:15 GMT
From:   "Martin Adamov" <martin.adamov@eatwithus.eu>
To:     <linux-doc@vger.kernel.org>
Subject: =?UTF-8?Q?=D0=9C=D0=BE=D1=82=D0=B8=D0=B2=D0=B8=D1=80=D0=B0=D0=BD_=D0=BF=D0=B5=D1=80=D1=81=D0=BE=D0=BD=D0=B0=D0=BB?=
X-Mailer: mail.eatwithus.eu
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
www.eatwithus.eu
