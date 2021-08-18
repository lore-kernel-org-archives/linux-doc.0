Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40AEC4338F
	for <linux-doc@archiver.kernel.org>; Wed, 18 Aug 2021 18:00:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 785DB61103
	for <linux-doc@archiver.kernel.org>; Wed, 18 Aug 2021 18:00:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbhHRSAe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Aug 2021 14:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbhHRSAa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Aug 2021 14:00:30 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 930B2C061764
        for <linux-doc@vger.kernel.org>; Wed, 18 Aug 2021 10:59:55 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id v1so2120858qva.7
        for <linux-doc@vger.kernel.org>; Wed, 18 Aug 2021 10:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=sHX1GFLe6DyaVgj2ladywzUsq0AZx6u4tNllVNyA7kg=;
        b=fLsj43bDNT+eIsz3kPm0FlmNVNM7cLNIJlpulK91N/tbNoLRIoqED86n1p/crsuErj
         jUBbDXBqqRylIJ0PI/cOYNpcWPBoqmJyytbWc6djJaSxUciBrhvcpp8oQdRHdcnJS2Ok
         xkZoVfbF/nSxf6yRLWyQKAUxe9XrRT9iHnVtGqKUPn0rJjVU620D1sO3xx803qHlR4um
         p2IpbccCX66zcPkiFxsHmbG1dgPzxL2F86/gdBtXZywO0ZyemCQa08NFFTubrzlf43qC
         6ZB4Bh5VMeOE8D7Us/sPx+zVWJEvJHZl4paq/RCteSWbpSx7936xIwy8c3gMltHYUQit
         bphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=sHX1GFLe6DyaVgj2ladywzUsq0AZx6u4tNllVNyA7kg=;
        b=o8/xilKv0f5o/tQ2mehJuuzafQfln4VTYksuuF5Y5qp1XqWW09cpt+PMGjLXwDRFa0
         LgRZKtsk/7CckGqEhNVWCtgFc5d8Vapsjlw1y4W6Xiz7Zw/ngOjjSnmw6iB0xiEoZ07/
         S/y2fsWx4XQrz2IZ83oLDU0WUsU9HRY1KWL7yJ6mEvCbZ8os06QxelXa0kcrepGHtJXR
         H6/IuTSNtGnEOR0rq/YVHg/Jv3EtoAVbI062IN52UEXbcGfmgtA9kEfh0zIcEKjqUh3y
         yOcjVaGMYQLaVhWQqZhnyUzbeFpKgDfPtACN0a0CA5ctTfYp95e6bdMpGQwtKpMmC96e
         mHyg==
X-Gm-Message-State: AOAM530/IbTSqKhsZ9cOJIRqpehMOgCVnllDfMmeEj/FY6MBt8nkb3j0
        6OL672iYLdhAJD6r3+Mt2NU=
X-Google-Smtp-Source: ABdhPJwkxjrO28XyH22gWzveAF3R9SydFuNobF7KEClsCDRf1TrveXuw4PtOJEeT5LLutLa09Z4k3A==
X-Received: by 2002:ad4:4e41:: with SMTP id eb1mr10158196qvb.3.1629309594722;
        Wed, 18 Aug 2021 10:59:54 -0700 (PDT)
Received: from vps.qemfd.net ([2600:3c02::f03c:91ff:fe93:b216])
        by smtp.gmail.com with ESMTPSA id y11sm266423qtx.13.2021.08.18.10.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 10:59:54 -0700 (PDT)
Received: from schwarzgerat.orthanc (schwarzgerat.danknet [192.168.128.2])
        by vps.qemfd.net (Postfix) with ESMTP id 956872B471;
        Wed, 18 Aug 2021 13:59:53 -0400 (EDT)
Received: by schwarzgerat.orthanc (Postfix, from userid 1000)
        id 977F0600B4F; Wed, 18 Aug 2021 13:59:53 -0400 (EDT)
Date:   Wed, 18 Aug 2021 13:59:53 -0400
From:   nick black <dankamongmen@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-doc@vger.kernel.org
Subject: [PATCH] serial-console.rst: break up code chunks
Message-ID: <YR1KmVfEmAZVGXIE@schwarzgerat.orthanc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Trivial: there are two code sections here, not one.
Break up the RST backticks.

Signed-off-by: Nick Black <dankamongmen@gmail.com>

---
 Documentation/admin-guide/serial-console.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git Documentation/admin-guide/serial-console.rst Documentation/admin-guide/serial-console.rst
index a8d1e36b627a..b8c803afae2f 100644
--- Documentation/admin-guide/serial-console.rst
+++ Documentation/admin-guide/serial-console.rst
@@ -96,7 +96,7 @@ Replace the sample values as needed.
    open ``/dev/console``. If you have created the new ``/dev/console`` device,
    and your console is NOT the virtual console some programs will fail.
    Those are programs that want to access the VT interface, and use
-   ``/dev/console instead of /dev/tty0``. Some of those programs are::
+   ``/dev/console`` instead of ``/dev/tty0``. Some of those programs are::
 
      Xfree86, svgalib, gpm, SVGATextMode
 
-- 
2.25.1


-- 
nick black -=- https://www.nick-black.com
to make an apple pie from scratch,
you need first invent a universe.
