Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D9CC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 28 Dec 2021 04:34:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233855AbhL1Ee7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Dec 2021 23:34:59 -0500
Received: from mail-4317.proton.ch ([185.70.43.17]:28447 "EHLO
        mail-4317.proton.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232698AbhL1Ee6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Dec 2021 23:34:58 -0500
Date:   Tue, 28 Dec 2021 04:34:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alshehhi.io;
        s=protonmail2; t=1640666096;
        bh=qa6i7+1SPmqYUkwkNL+tG0H5j8YDywJ1Qf5kw8wim4Y=;
        h=Date:To:From:Reply-To:Subject:Message-ID:From:To:Cc;
        b=dx6dEDHVE28dmMvts6iozm3Lorso+hB26X8CEdLdExIgTeU20/sGG96+2l9rrrXZi
         qO7d7jOGJoiRNAipp1VwvKmtSN6C14tS/EXwfauOnThhe6EAtYwQb5byMhGX0JrGMa
         Fb3iFeprni0J36T2AubgvALTJRadv2x26vujHTJM1tGsLKettNxCpGEtKDz99zNsT/
         7ML5MnEeGOlmu5P7Iy7NPnlZgjzxnGco2JRmCj1wl8PFVpeFWIwo5C6RwdzX5+E8/M
         J1QGMdACbEOtrFBcRhIcC1WMT75lnUCHAV3hn3karkstSNEVhE3DQx8RgRCKL8GwdP
         lgjk89Slw71eg==
To:     linux-doc@vger.kernel.org
From:   Husain Alshehhi <husain@alshehhi.io>
Reply-To: Husain Alshehhi <husain@alshehhi.io>
Subject: libelf is not included in the required software for building the kernel
Message-ID: <87y245e49p.fsf@alshehhi.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The minimum requirement doc[1] does not list libelf. When building without =
libelf, I got the following error:

<stdin>:1:10: fatal error: libelf.h: No such file or directory
compilation terminated.
HOSTCC  /home/husain/src/linux/tools/objtool/fixdep.o
HOSTLD  /home/husain/src/linux/tools/objtool/fixdep-in.o
LINK    /home/husain/src/linux/tools/objtool/fixdep
CC      /home/husain/src/linux/tools/objtool/exec-cmd.o
CC      /home/husain/src/linux/tools/objtool/help.o
CC      /home/husain/src/linux/tools/objtool/pager.o
CC      /home/husain/src/linux/tools/objtool/parse-options.o
CC      /home/husain/src/linux/tools/objtool/run-command.o
CC      /home/husain/src/linux/tools/objtool/sigchain.o
CC      /home/husain/src/linux/tools/objtool/subcmd-config.o
LD      /home/husain/src/linux/tools/objtool/libsubcmd-in.o
AR      /home/husain/src/linux/tools/objtool/libsubcmd.a
CC      /home/husain/src/linux/tools/objtool/arch/x86/special.o
In file included from /home/husain/src/linux/tools/objtool/include/objtool/=
objtool.h:13,
                from /home/husain/src/linux/tools/objtool/include/objtool/a=
rch.h:11,
                from /home/husain/src/linux/tools/objtool/include/objtool/c=
heck.h:11,
                from /home/husain/src/linux/tools/objtool/include/objtool/s=
pecial.h:10,
                from arch/x86/special.c:4:
/home/husain/src/linux/tools/objtool/include/objtool/elf.h:10:10: fatal err=
or: gelf.h: No such file or directory
10 | #include <gelf.h>
 ^~~~~~~~

Should libelf not be part of the list?

[1] <https://www.kernel.org/doc/html/latest/process/changes.html>

