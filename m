Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68D72D94BD
	for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 23:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765496559; cv=none; b=folHW5fv/tA4raO+TnNl3M9dailBVQm7K/wJ2dEou0TOlndeZ2CBQPBTzx2KQoUOy/gTmMNXry4h0verI8gjAJoZbPLlw/HoO0Zarz2wV5IHHZi3eX6jQ2EKVb9Igoeq9nwNUmLgOlJCqKdZoLRH7cGxIzEOqs+9jkvI3GHBz7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765496559; c=relaxed/simple;
	bh=mS/v+oi68CSHxYHnsW3l0bDBdbsEvqBTvCEdueH9ILU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UraEoroVeHR0sWObZtYcFiPz9YZDEt5TPqTMOimAl1TOyUF+crLzkrHR/FbBdsIZPvbUuqDNmJHT4A4MscSc3WUfB9QIJVk7lujOnnU52roVz4rZH1wldFjdECcBJU3rYJFB1k4uFRsvSbGNZj0QeQ88mn3gYvCXpNPt8spQvGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c5Fxgrym; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Adf4O3RN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c5Fxgrym";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Adf4O3RN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765496557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kQ05QP/ghnLW4m7tIq998Ky6NZNvVDgiZQPKkoDaJ98=;
	b=c5Fxgrym40sYebPVuOpWAt3MQFjjGO0LLSzoNEDdY23Gd+ZfZcuF54UHIjk3UXOpYZB284
	6h9vLMd+RR9gigOgPfXjGP4MfqzmdxKWrj/5xlByD0Vbdi7DulqNY1SEBk/5Qw2MhzSv7C
	wL3vKsPBvWl9AzwCBaddpo+N2GXqb0A=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-Ow6t5iwePam_5tJoc0cVSQ-1; Thu, 11 Dec 2025 18:42:30 -0500
X-MC-Unique: Ow6t5iwePam_5tJoc0cVSQ-1
X-Mimecast-MFC-AGG-ID: Ow6t5iwePam_5tJoc0cVSQ_1765496549
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f13989cd3so10595035ad.1
        for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 15:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765496549; x=1766101349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kQ05QP/ghnLW4m7tIq998Ky6NZNvVDgiZQPKkoDaJ98=;
        b=Adf4O3RNxfUaaNQPKseDRaJRIsf9mN90PBd75+H1Cjbt4kaTvZ9+/ANR9XeOVsC98K
         fB2Jhot7PycwEEGHsUx5VdEsmLf+e83w9Neb3m4FcZYaQaEuMUqPBuEds2zJ+dv1RZc2
         OfnJb5e/Dn/CH35qvans5IwOzebtOuF9TEjTQ6++7ITo9icXXusAE+i8qVC0tycxYZKV
         ik53WgVTIDViKsKkeqN4esvoFlSYUpq0poqnjHRuhrvb1JaJAlWf4r96S75b3d6XG9Og
         d9ZJUo3rkm4s22KEzA46oIlKAyiqEuEeQn9mKLhtbsMw9W6QpJc+OFNQWROgr28Ywz2G
         fzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765496549; x=1766101349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kQ05QP/ghnLW4m7tIq998Ky6NZNvVDgiZQPKkoDaJ98=;
        b=b1l1NO76l1e95Yz+XJ3OsEmUWDWv1SzqglcqBjWi72MDMPrEDcCrSuJxBsqKFARDbV
         idzwZLUMV/HtuCvR5FdnjyZJpy3nr5ZumhRl96biYFKrO/5uGUlBmCIiEu/S+qWNdMoN
         yMoob2JhR6YEnj9cx2noZMv21fKaUk52zFDTn91uUKjP+Gfthc8NWRRvjWu0aDP6cvmJ
         gWGG0DasulE5nHpbeFvWlKFLZz5ghTibOHgzGgCmu5JcKN4aOvUtVnQ4LXs6n9E7ICnw
         IUWaUWb4J7wrsHVAk6+EUjzbyG1xpeIpFYQZQG/ISOg8vS/onfqAY7JLaW6tK4KgDcLN
         3hmw==
X-Gm-Message-State: AOJu0YwwrUTwI6A/rQK3rtURmbdGhMfstZWPnKlRCGxEENjvVdaSynRD
	FBXnWBbj0h0lNyazHM8T+dwzXpLm5/IPR1gJhnhMgOeav/Ta1j+S/t3v8e5yM8bhE185A/3TkDE
	WjX31aOHX+u6YUL/tShpAaVNxkLcVl6bsne16JFygsiKPZo3gHse4pVShccqZRQ==
X-Gm-Gg: AY/fxX6PQ8go0mKne8Yh8z6k++NsM/OGtF0Zmvhvhxu/jKIiuU+xOtFfnBuDg57Heib
	n06cRWk5nK/SgIIBL3fcqqh5j3Zvi98W9UM36Y4MPrRtRNF8+xp7ClrpS+oI901gM1BEdF4U6cD
	IC3Jzr/v8Yl6k6H0Mg7IkvuHikFZM/3uekYdNtL04cwYtMTV/2g1BRHqeO3WwyNz+5mPXoy1RIl
	CujE74sjYPuDrCOBBrkiaYVvb/T7EFUig3CZkmeUVk7U+RcOsy8iML1QF+hL8BKtEy0ZmClTcm2
	3vpu+Vb48x2a9dHRuipNSbtv/yuw10nq9iSb0ZsZgvp92xuFw8jma6BI0T0XGT1Oz+A0Lhyjthv
	x13eZuxBzyHOHQXhkuEHNSFTy9Tov8bzeMXygmnPJN5KpQIbRpDrioA==
X-Received: by 2002:a05:7022:5f06:b0:11b:9386:7ecd with SMTP id a92af1059eb24-11f34c44b2dmr208526c88.42.1765496549333;
        Thu, 11 Dec 2025 15:42:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELCJInk7lQuUHxLyD997AlteDUH9LbWkHETFsuUKnuraD2vMabV80vXaNE43TCfdpMJm+JOg==
X-Received: by 2002:a05:7022:5f06:b0:11b:9386:7ecd with SMTP id a92af1059eb24-11f34c44b2dmr208503c88.42.1765496548910;
        Thu, 11 Dec 2025 15:42:28 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e304766sm12034395c88.13.2025.12.11.15.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:42:28 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:41:40 +0900
Subject: [PATCH 1/3] clk: test: remove references to clk_ops.round_rate
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-clk-remove-round-rate-v1-1-5c3d5f3edc78@redhat.com>
References: <20251212-clk-remove-round-rate-v1-0-5c3d5f3edc78@redhat.com>
In-Reply-To: <20251212-clk-remove-round-rate-v1-0-5c3d5f3edc78@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2657; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=mS/v+oi68CSHxYHnsW3l0bDBdbsEvqBTvCEdueH9ILU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtw27+fRZ04e3p2XNVd/p1RvPaXr9Xkuiz3olhkh63X
 cILswDWjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACbSPImR4av9/8fP+i+f0OJT
 T34dHbl4ivAS13V7yyaLn2/jCDo04SbDP5O3ae4WrVu/iXMKeQpdipycf86+z2bZwcm39zyI/82
 9lgUA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The round_rate() clk ops is going away, so let's go ahead and remove any
references to it in the comments.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index a268d7b5d4cb28ec1f029f828c31107f8e130556..b1961daac5e22fb84f493f04feab1ff94a975d90 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -241,8 +241,8 @@ static void clk_test_get_rate(struct kunit *test)
  * Test that, after a call to clk_set_rate(), the rate returned by
  * clk_get_rate() matches.
  *
- * This assumes that clk_ops.determine_rate or clk_ops.round_rate won't
- * modify the requested rate, which is our case in clk_dummy_rate_ops.
+ * This assumes that clk_ops.determine_rate won't modify the requested rate,
+ * which is our case in clk_dummy_rate_ops.
  */
 static void clk_test_set_get_rate(struct kunit *test)
 {
@@ -266,8 +266,8 @@ static void clk_test_set_get_rate(struct kunit *test)
  * Test that, after several calls to clk_set_rate(), the rate returned
  * by clk_get_rate() matches the last one.
  *
- * This assumes that clk_ops.determine_rate or clk_ops.round_rate won't
- * modify the requested rate, which is our case in clk_dummy_rate_ops.
+ * This assumes that clk_ops.determine_rate won't modify the requested rate,
+ * which is our case in clk_dummy_rate_ops.
  */
 static void clk_test_set_set_get_rate(struct kunit *test)
 {
@@ -1675,8 +1675,8 @@ static void clk_range_test_set_range_set_round_rate_consistent_higher(struct kun
  * call to clk_set_rate_range(), the rate will be raised to match the
  * new minimum.
  *
- * This assumes that clk_ops.determine_rate or clk_ops.round_rate won't
- * modify the requested rate, which is our case in clk_dummy_rate_ops.
+ * This assumes that clk_ops.determine_rate won't modify the requested rate,
+ * which is our case in clk_dummy_rate_ops.
  */
 static void clk_range_test_set_range_get_rate_raised(struct kunit *test)
 {
@@ -1707,8 +1707,8 @@ static void clk_range_test_set_range_get_rate_raised(struct kunit *test)
  * call to clk_set_rate_range(), the rate will be lowered to match the
  * new maximum.
  *
- * This assumes that clk_ops.determine_rate or clk_ops.round_rate won't
- * modify the requested rate, which is our case in clk_dummy_rate_ops.
+ * This assumes that clk_ops.determine_rate won't modify the requested rate,
+ * which is our case in clk_dummy_rate_ops.
  */
 static void clk_range_test_set_range_get_rate_lowered(struct kunit *test)
 {

-- 
2.52.0

