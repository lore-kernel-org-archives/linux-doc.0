Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7474C7D0DD
	for <lwn-linux-doc@archive.lwn.net>; Sat, 12 May 2018 11:24:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751474AbeELLYk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 12 May 2018 07:24:40 -0400
Received: from mail-wr0-f193.google.com ([209.85.128.193]:36276 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751089AbeELLYi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 12 May 2018 07:24:38 -0400
Received: by mail-wr0-f193.google.com with SMTP id p4-v6so7694722wrh.3;
        Sat, 12 May 2018 04:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/RzGimCxJbJBH2tQnyt7MUJ1Br3aVWrZuc1tyQruatM=;
        b=Zn2YUER0TFRAFKlqNJkg/upLv816Hhsv7ITrDUJ+XcGUIIB4UikrTGZF9liLHTSyUU
         nEUPDPWSMwyZYhp0WwPtplhNzag1KRrhyDJpS1/UbyoWjgP/6b+gtpa9ow0aUdLheLoE
         3rnInv0r9eq5GPgf7yUukCKQXZY6KOQ9H9gD6K1rX+Cg5Kd4mR3ICHd+SLLYMJklPlO2
         X8bGvi2ApIGQvfOmU4YrotFwviT6LT5mxMyH+ZQDzH0a1CP1YsYHlHKqnNCmmZq/X0Zc
         4IWXbRAtDAua3oFVBcCOC/FddN7Pw12UfXOKWi4LVhXLH9vURQUt6UDAq4TNw/0IW8yZ
         7lvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/RzGimCxJbJBH2tQnyt7MUJ1Br3aVWrZuc1tyQruatM=;
        b=ZtK9lL3dfqVX3GVIn7CYDChb90xiCQK7wo25o8+CT0xLv2Tf72BkkzYjckZ+UOCWbH
         pamfZBGQhSnBTG7emb8JAzWggObMnMCkQcwGxYofR0OFO3s2PtpEQcfFhVGkFRoLrm5F
         FcoIc6ymwiDrOAwKtcBD9jppyRoa+6fWc2Cbj+fMDHU69VueaJtyBZK1O+A9ablikB75
         L877h1fLt7VSx2sE6U6ts3jraS4HFLyXpu4x470LDCmTRremEa11Be8lC5PLNy7xA3sm
         RQWjd94XdVgm1RfSYYOiP/8UVv1fyxXjiOcld/dp04i4+vQBJ5WwelpsA7fwin6ZKMdy
         GZgA==
X-Gm-Message-State: ALKqPwecQYVQrE71wOMPXku7PcTjwiVKXX3iAuoawmXknHhy4mTMYOcP
        oVp4Rw4//x4f/ppwzQma/KlU6Q==
X-Google-Smtp-Source: AB8JxZpPNhg8apfK7bCjjrYJaoR6ZTj/EQNKopZpPGqP+22B2hiJhTRwBPBNrUWSajRjGto0rm9MdQ==
X-Received: by 2002:adf:b3d7:: with SMTP id x23-v6mr1833986wrd.142.1526124276246;
        Sat, 12 May 2018 04:24:36 -0700 (PDT)
Received: from dvbdev.wuest.de (ip-176-199-71-134.hsi06.unitymediagroup.de. [176.199.71.134])
        by smtp.gmail.com with ESMTPSA id 141-v6sm3845434wmf.35.2018.05.12.04.24.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 12 May 2018 04:24:35 -0700 (PDT)
From:   Daniel Scheller <d.scheller.oss@gmail.com>
To:     linux-media@vger.kernel.org, mchehab@kernel.org,
        mchehab@s-opensource.com, mchehab+samsung@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-s390@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] Documentation: ioctl-number: add ddbridge IOCTLs
Date:   Sat, 12 May 2018 13:24:30 +0200
Message-Id: <20180512112432.30887-2-d.scheller.oss@gmail.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180512112432.30887-1-d.scheller.oss@gmail.com>
References: <20180512112432.30887-1-d.scheller.oss@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Daniel Scheller <d.scheller@gmx.net>

drivers/media/pci/ddbridge exposes a few IOCTLs which are used by userspace
utilities to ie. update PCIe card's FPGA firmware.

The IOCTLs chosen are in the range 0xDD/0xE0 up to 0xDD/0xFF, with 0xDD as
sort of gimmick for "Digital Devices". To not conflict with the zfpc driver
the upper range (0xE0-0xFF) is used. It is not clear if and which IOCTL
numbers the zfpc driver really uses, from reading the sources at
drivers/s390/scsi/ I couldn't really determine if IOCTLs are in use at all.
Maybe the S390 maintainers can double-check or comment, thus Cc linux-s390.

The upstream dddvb driver currently exposes 12 IOCTLs from which we're
going to handle two at the moment (DDB_FLASHIO and DDB_ID), which is all
that's required to perform the FPGA update on this hardware. The
"reservation" of 32 IDs may seem way too much in this regard, however,
we'd like to be able to stay compatible with the upstream out-of-tree
driver as much as possible, so should any of the remaining 10 IOCTLs be
required at any time (or even more, should upstream add more in the
future), we can just add them into this range without any hassles or
without creating conflicts anywhere.

Cc: linux-doc@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Daniel Scheller <d.scheller@gmx.net>
---
 Documentation/ioctl/ioctl-number.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/ioctl/ioctl-number.txt b/Documentation/ioctl/ioctl-number.txt
index 84bb74dcae12..feac1b56900b 100644
--- a/Documentation/ioctl/ioctl-number.txt
+++ b/Documentation/ioctl/ioctl-number.txt
@@ -334,6 +334,7 @@ Code  Seq#(hex)	Include File		Comments
 0xDB	00-0F	drivers/char/mwave/mwavepub.h
 0xDD	00-3F	ZFCP device driver	see drivers/s390/scsi/
 					<mailto:aherrman@de.ibm.com>
+0xDD	E0-FF	linux/ddbridge-ioctl.h
 0xE5	00-3F	linux/fuse.h
 0xEC	00-01	drivers/platform/chrome/cros_ec_dev.h	ChromeOS EC driver
 0xF3	00-3F	drivers/usb/misc/sisusbvga/sisusb.h	sisfb (in development)
-- 
2.16.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
