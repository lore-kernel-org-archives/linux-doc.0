Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0675A7DE74
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 May 2018 03:10:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756585AbeEJDJg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 May 2018 23:09:36 -0400
Received: from mail-pg0-f65.google.com ([74.125.83.65]:37253 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756495AbeEJDJe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 May 2018 23:09:34 -0400
Received: by mail-pg0-f65.google.com with SMTP id a13-v6so318053pgu.4;
        Wed, 09 May 2018 20:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mail-followup-to:mime-version
         :content-disposition:user-agent;
        bh=qZF8h8DQ9I+8U2Zr4szhOaE5QAW58hXbd+ietQCBdvs=;
        b=EaoJyubEQbD+jCymozz1/DL/tj4z53X3MkjrxzCJDGgNqOyVXjc2RREzV8/TWx39SX
         7kZtlcwxtB02HjbP4oli9Ibb2G7XBEeqjgshjYI7z/icIHEiKjuBPnfRUPPhqsuiFoz/
         h1Gb+1uGJYvtsjuOZAJdc57FJPnIMZIafFhF3ZAda36qE+61xsVr/FJMbEza93YRfhTA
         qGShzXTRbwn7zoaLgF3TaUvNfPc7lxmrYqEw9aGAEOzjMyR0LNpPLzJOmvWzKHT14UvW
         Xyh8f1MtsLhVtXySB/12K1+ai8Up4Z2/kCg/tvEMVy7nnSF2fILb3IWvJGp7ECuyLqy2
         zKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:mime-version:content-disposition:user-agent;
        bh=qZF8h8DQ9I+8U2Zr4szhOaE5QAW58hXbd+ietQCBdvs=;
        b=rrTe7JANm2MtO26jVkDu0ZnUhQILny4GJ6XkPy7Xc5NjLA9v8WN3o3ldeRHvK1rn0x
         dwA4l+ku/LgPhojrw42TPxdVSqyF7EMCuCB0Bmbcx5ZKvDMjE8OxHWsOHw37LFn7Bq4Y
         W4DLWOPv5af6B/60SXQvenGEIIu30MO6e7jv6K74gU0blVPiUMEpwpNM7VENDB3yBxJE
         xdpwcUYTERO4l60uiVssio6zOec8aIEsIAROV7Bnk/7H9XX2Ab1O5uF74w6dYYW7gwwI
         Mcz+dKD4iQPyJYWT7cFoSbHvO6ZoTGrvSaNI4f/VxOBWAgteKqjcUHTkeC1NVEz0QfWo
         C7UQ==
X-Gm-Message-State: ALQs6tBFATXbLIoyexN5W1D5Aol8WjXup5KvNMFDYmGNas5JOPrEcslQ
        FXqCL5iTRCs/+7Tv+8a6Y0KpoHZu
X-Google-Smtp-Source: AB8JxZp/JRPFUWw92gZxYlMpWF86dy3sNDpERq0vSULK2E2hjDQ0hsb9jXboUYz+uJkb4unEDvToLA==
X-Received: by 10.98.202.152 with SMTP id y24mr45544086pfk.187.1525921773431;
        Wed, 09 May 2018 20:09:33 -0700 (PDT)
Received: from udknight.localhost ([183.90.36.235])
        by smtp.gmail.com with ESMTPSA id r90sm54024706pfg.122.2018.05.09.20.09.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 May 2018 20:09:32 -0700 (PDT)
Received: from udknight.localhost (localhost [127.0.0.1])
        by udknight.localhost (8.14.9/8.14.9) with ESMTP id w4A39M4u025975;
        Thu, 10 May 2018 11:09:22 +0800
Received: (from root@localhost)
        by udknight.localhost (8.14.9/8.14.9/Submit) id w4A39LtB025972;
        Thu, 10 May 2018 11:09:21 +0800
Date:   Thu, 10 May 2018 11:09:21 +0800
From:   Wang YanQing <udknight@gmail.com>
To:     daniel@iogearbox.net
Cc:     ast@kernel.org, corbet@lwn.net, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH] bpf, doc: clarification for the meaning of 'id'
Message-ID: <20180510030921.GA25941@udknight>
Mail-Followup-To: Wang YanQing <udknight@gmail.com>, daniel@iogearbox.net,
        ast@kernel.org, corbet@lwn.net, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.7.1 (2016-10-04)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

For me, as a reader whose mother language isn't English, the
old words bring a little difficulty to catch the meaning, this
patch rewords the subsection in a more clarificatory way.

This patch also add blank lines as separator at two places
to improve readability.

Signed-off-by: Wang YanQing <udknight@gmail.com>
---
 Documentation/networking/filter.txt | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/Documentation/networking/filter.txt b/Documentation/networking/filter.txt
index 5032e12..e6b4ebb 100644
--- a/Documentation/networking/filter.txt
+++ b/Documentation/networking/filter.txt
@@ -1142,6 +1142,7 @@ into a register from memory, the register's top 56 bits are known zero, while
 the low 8 are unknown - which is represented as the tnum (0x0; 0xff).  If we
 then OR this with 0x40, we get (0x40; 0xbf), then if we add 1 we get (0x0;
 0x1ff), because of potential carries.
+
 Besides arithmetic, the register state can also be updated by conditional
 branches.  For instance, if a SCALAR_VALUE is compared > 8, in the 'true' branch
 it will have a umin_value (unsigned minimum value) of 9, whereas in the 'false'
@@ -1150,14 +1151,16 @@ BPF_JSGE) would instead update the signed minimum/maximum values.  Information
 from the signed and unsigned bounds can be combined; for instance if a value is
 first tested < 8 and then tested s> 4, the verifier will conclude that the value
 is also > 4 and s< 8, since the bounds prevent crossing the sign boundary.
+
 PTR_TO_PACKETs with a variable offset part have an 'id', which is common to all
 pointers sharing that same variable offset.  This is important for packet range
-checks: after adding some variable to a packet pointer, if you then copy it to
-another register and (say) add a constant 4, both registers will share the same
-'id' but one will have a fixed offset of +4.  Then if it is bounds-checked and
-found to be less than a PTR_TO_PACKET_END, the other register is now known to
-have a safe range of at least 4 bytes.  See 'Direct packet access', below, for
-more on PTR_TO_PACKET ranges.
+checks: after adding a variable to a packet pointer register A, if you then copy
+it to another register B and then add a constant 4 to A, both registers will
+share the same 'id' but the A will have a fixed offset of +4.  Then if A is
+bounds-checked and found to be less than a PTR_TO_PACKET_END, the register B is
+now known to have a safe range of at least 4 bytes.  See 'Direct packet access',
+below, for more on PTR_TO_PACKET ranges.
+
 The 'id' field is also used on PTR_TO_MAP_VALUE_OR_NULL, common to all copies of
 the pointer returned from a map lookup.  This means that when one copy is
 checked and found to be non-NULL, all copies can become PTR_TO_MAP_VALUEs.
-- 
1.8.5.6.2.g3d8a54e.dirty
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
