Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 057FC7DD32
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Apr 2018 17:18:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755917AbeDYRSE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Apr 2018 13:18:04 -0400
Received: from mail-wm0-f67.google.com ([74.125.82.67]:37386 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755015AbeDYRRr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Apr 2018 13:17:47 -0400
Received: by mail-wm0-f67.google.com with SMTP id l16so8178160wmh.2
        for <linux-doc@vger.kernel.org>; Wed, 25 Apr 2018 10:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=E1/zc02CwK/C9ZQpxhbxPyX1TLiwTYPGbFvUxsbuIhE=;
        b=yWYKKteoYmlBRoR1jdTYsysa5I20HBiWGzHyLIPMc4fjVJmFXiwEoAkHRAu5npRmiT
         tD7aUGcKn1tuA0lstw+iSjlXKXdek7ZacCtabG7nMmqS+Lx/YYa5GzlF1pgvnEi3bHhp
         4lAcfcqXQQDx8VJyHW2a4aBnslFZJ6s46LG2cFQWOgbzURiyUlKUg58EvB/KWHRKRaKz
         l9Ff63EpixnHTrE/bDJOPiHS5GHK+j9sa7BkSaePsc2aTKq2dlEj6z2JM566PIPivDjo
         e8QJyKrS/O2VOJkwtv+oEJPFvVJw4XraNO1E8iI3Q8TuPIr1zbFrOsUOCmtQsQ+OdxBT
         esFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=E1/zc02CwK/C9ZQpxhbxPyX1TLiwTYPGbFvUxsbuIhE=;
        b=NKB7M1u5EdRhrr/lSHQkSUvsN4FH3Yd7WucONdUnaBGs4LIZy91qznq2YGuC85LZfU
         sJg6FKFpTTJ1Lk6xg58U4vAHb5MEGNaRI9vWkt2DJQNn4NIZIMG0ieo+SHxal7NFa5hG
         cvDkiyvuI+MfRfV9+/3c3ccb3RLj4THdAQ3qoA4oKazh0qNOYIBRMnciV5PnnCjpLQTk
         obsh9HbkmuO1hUMmqTAQcwDNb/feFC0bYoooxYg8oowkts+VA+tu6iEUJA0u1TF7fwzL
         hxyt8nfNUwaOBmHTIJdRVu8LxpaUPWbzXcmQIszD2V9FeJnqOMq9ih89YZaX6J6GLhIx
         sAPQ==
X-Gm-Message-State: ALQs6tAevtsZ2TFbJlHkSRYOK8qttMEUvEP13MKGPtZXXLj9btv/CAhX
        1m37hy0Hlw4EUV5qH3RL4s/gPg==
X-Google-Smtp-Source: AIpwx48Unl2MN7Dst2P/2CBuzLtE/6UfMLtSUGebySEpK3TxkTjWwmQHWoEJWWxnCIedHJ1dwN+Lyg==
X-Received: by 10.167.211.78 with SMTP id m14mr29199267edr.108.1524676666604;
        Wed, 25 Apr 2018 10:17:46 -0700 (PDT)
Received: from reblochon.netronome.com (host-79-78-33-110.static.as9105.net. [79.78.33.110])
        by smtp.gmail.com with ESMTPSA id p36sm12277957eda.43.2018.04.25.10.17.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Apr 2018 10:17:45 -0700 (PDT)
From:   Quentin Monnet <quentin.monnet@netronome.com>
To:     daniel@iogearbox.net, ast@kernel.org
Cc:     netdev@vger.kernel.org, oss-drivers@netronome.com,
        quentin.monnet@netronome.com, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org,
        "Nikita V . Shirokov" <tehnerd@tehnerd.com>,
        Eyal Birger <eyal.birger@gmail.com>
Subject: [PATCH bpf-next v4 09/10] bpf: add documentation for eBPF helpers (65-66)
Date:   Wed, 25 Apr 2018 18:17:00 +0100
Message-Id: <20180425171701.11048-10-quentin.monnet@netronome.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180425171701.11048-1-quentin.monnet@netronome.com>
References: <20180425171701.11048-1-quentin.monnet@netronome.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add documentation for eBPF helper functions to bpf.h user header file.
This documentation can be parsed with the Python script provided in
another commit of the patch series, in order to provide a RST document
that can later be converted into a man page.

The objective is to make the documentation easily understandable and
accessible to all eBPF developers, including beginners.

This patch contains descriptions for the following helper functions:

Helper from Nikita:
- bpf_xdp_adjust_tail()

Helper from Eyal:
- bpf_skb_get_xfrm_state()

v4:
- New patch (helpers did not exist yet for previous versions).

Cc: Nikita V. Shirokov <tehnerd@tehnerd.com>
Cc: Eyal Birger <eyal.birger@gmail.com>
Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
---
 include/uapi/linux/bpf.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index 335ac427d43b..3b91e22f68c1 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -1737,6 +1737,36 @@ union bpf_attr {
  * 		must be set to zero.
  * 	Return
  * 		0 on success, or a negative error in case of failure.
+ *
+ * int bpf_xdp_adjust_tail(struct xdp_buff *xdp_md, int delta)
+ * 	Description
+ * 		Adjust (move) *xdp_md*\ **->data_end** by *delta* bytes. It is
+ * 		only possible to shrink the packet as of this writing,
+ * 		therefore *delta* must be a negative integer.
+ *
+ * 		A call to this helper is susceptible to change the underlaying
+ * 		packet buffer. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again, if the helper is used in combination with
+ * 		direct packet access.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
+ * int bpf_skb_get_xfrm_state(struct sk_buff *skb, u32 index, struct bpf_xfrm_state *xfrm_state, u32 size, u64 flags)
+ * 	Description
+ * 		Retrieve the XFRM state (IP transform framework, see also
+ * 		**ip-xfrm(8)**) at *index* in XFRM "security path" for *skb*.
+ *
+ * 		The retrieved value is stored in the **struct bpf_xfrm_state**
+ * 		pointed by *xfrm_state* and of length *size*.
+ *
+ * 		All values for *flags* are reserved for future usage, and must
+ * 		be left at zero.
+ *
+ * 		This helper is available only if the kernel was compiled with
+ * 		**CONFIG_XFRM** configuration option.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
  */
 #define __BPF_FUNC_MAPPER(FN)		\
 	FN(unspec),			\
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
