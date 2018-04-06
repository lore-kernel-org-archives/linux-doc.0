Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 657C97DD32
	for <lwn-linux-doc@archive.lwn.net>; Fri,  6 Apr 2018 03:38:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751435AbeDFDip (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 5 Apr 2018 23:38:45 -0400
Received: from mail-pl0-f54.google.com ([209.85.160.54]:33039 "EHLO
        mail-pl0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751413AbeDFDio (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Apr 2018 23:38:44 -0400
Received: by mail-pl0-f54.google.com with SMTP id s10-v6so19901280plp.0;
        Thu, 05 Apr 2018 20:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=AnhOJgQMN/qNv36SaMEY8JyH3/1Qg86EKEw5fzIb51E=;
        b=qF6y4pG9And5HdSiE0PXiTshstJq8cJ4baAjQ+rMbx3OlYqCSctvPyVysKpAJ+hU/L
         FTdizQyim6kgZOU3U/94b9cq8tABY2Mv6rTAL+PMM+uhEeCvOGbAAd8AHiug8T3JDlOv
         IyC6eQDfc794IFnzpkWuznKn3sKWsqGD0Gpqo8kcgtxAONYNzplNaLDmOkOM2iVTh8xU
         M58M3QTeeug3gM998vA1wYfyQ19x4Lw7rLx8Wh4okSAQYdXQlWD0Md0OTMqD5wqv45Lk
         0I2BcjSUVpKbMaHI42z7uzAnBgSvrzxjZ7SOFt/7ATl7A9stKVcfN6DCrSMj4MddHBZZ
         VGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=AnhOJgQMN/qNv36SaMEY8JyH3/1Qg86EKEw5fzIb51E=;
        b=SWxVkEoFJ84qW7g3LYa+Q9gnyPPVL8XNz8TShtpHllVmMvFnKzfGUvCna0/dQvz66w
         enqeUVN6iM/B9JZ5jPA3UvTcuMW0G/7Ej9DSvvHC1dRbE2n5bk1CO7xChdtszR4Jf1zB
         ujvHroZStLrThfGjrjke2SxLAGYle8hO38I6XdIw3UB6Teet8vwoMXJRJNXMIhQ9iX9W
         oLAEp9v2oYR3jdtcd/MCRDwvksDDssBLTqq4bjiDHcmnBxkU1deZqNHLX/OC1Lr+EeLq
         i2UPQ+D72sX/ewDX/rYvuipkUqQsLJJaTprpQmDqAtn2tIpNH7MJ4Mc9ivMfsfG9CzOV
         fBnA==
X-Gm-Message-State: ALQs6tDH2/t/+vYWf9O5Qc+Ueddffjvp1hwcLQwseXclXSkS2H5OnamY
        Uz14py3BlckEmid1CumZlC/HJDRkjTBPBmjm6BZ8BA==
X-Google-Smtp-Source: AIpwx4/kcvllegs4sgeptGAfoR1NCh6JAVUeAs+7/WQU0xc3bYRs66CsVM33tNpbBnvC520s0lR052dKNoNZZJ4EIUs=
X-Received: by 2002:a17:902:848c:: with SMTP id c12-v6mr3891958plo.316.1522985923286;
 Thu, 05 Apr 2018 20:38:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.140.3 with HTTP; Thu, 5 Apr 2018 20:38:42 -0700 (PDT)
From:   Masanari Iida <standby24x7@gmail.com>
Date:   Fri, 6 Apr 2018 12:38:42 +0900
Message-ID: <CALLJCT0MFg6b+dG50cqe_hv6hxmQDj-ZM066BOtQt_wOiC8ENA@mail.gmail.com>
Subject: make xmldocs failed with error after 4.17 merge period
To:     linux-kernel@vger.kernel.org,
        linux-doc <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        heikki.krogerus@linux.intel.com,
        Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

After merge following patch during 4.17 merger period,
make xmldocs start to fail with error.

 [bdecb33af34f79cbfbb656661210f77c8b8b5b5f]
usb: typec: API for controlling USB Type-C Multiplexers

Error messages.
reST markup error:
/home/iida/Repo/linux-2.6/Documentation/driver-api/usb/typec.rst:215:
(SEVERE/4) Unexpected section title or transition.

------------------------
Documentation/Makefile:93: recipe for target 'xmldocs' failed
make[1]: *** [xmldocs] Error 1
Makefile:1527: recipe for target 'xmldocs' failed
make: *** [xmldocs] Error 2

$

An ascii graphic in typec.rst cause the error.

Masanari Iida
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
