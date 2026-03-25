Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6AA1DE8AF
	for <linux-doc@vger.kernel.org>; Wed, 25 Mar 2026 23:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774482768; cv=none; b=GuptKiauFIMJBRFMxhcztblo5T2UxsRtjkt0e5Nw0+bL8Mgx9kuqqmGRGxn4RRaMpUH3mIu3fjjgREh9JRHhBDXNxk9NcUIp9QMsLl7raoVALW66ZckE8IF4u1CgrSY4SA3BQtzMZQLKz2e3M0ihl6+29gfe/3hi1yshmJrWVtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774482768; c=relaxed/simple;
	bh=rXRD/VUBdjTgqVrg6At08VQ99MspomXd4n+3eE8Z15Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XGQG3SZgz8yzVK+M3CyxYjPPt7pymJGra0TAsJNAfIPmwSz7oLkDH/ec9fZZN6NkX0h3H7BetjYcNhSqwxPnOK9ImyhBmM/wfMHTMtkVudFLzePCwYtzNQr/aaJG6835ZCotXOU51RpKUTZ0UZgyMYxZznBX9LLJ0f4Y/N7oGuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pj89hZeb; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ehBYSo2v; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pj89hZeb";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ehBYSo2v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774482765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8xBD/ObT79//9xMsrPokjqU4w5LxcEClKAdIR9Wy8OA=;
	b=Pj89hZeblZu/1E84URK7f0cvUBotwoiYoH3T2BoL+p8dfp2Pi7k9lHHniSJSMcVr8/TKg1
	kVgCzW3W5qcDHmLouvZQThXJeP4u0cInEOYUBkITatar6j1j6yt2GYE/Ksu1sD/Dq2uuPQ
	1xbWN4HKul67+uji4eACxkIwvRfsH70=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-34Sf5GX_NE2zRvrXiQKRiQ-1; Wed, 25 Mar 2026 19:52:43 -0400
X-MC-Unique: 34Sf5GX_NE2zRvrXiQKRiQ-1
X-Mimecast-MFC-AGG-ID: 34Sf5GX_NE2zRvrXiQKRiQ_1774482763
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cdb995a1bfso174567885a.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Mar 2026 16:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774482763; x=1775087563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xBD/ObT79//9xMsrPokjqU4w5LxcEClKAdIR9Wy8OA=;
        b=ehBYSo2vPtHz1z6kV/ry43eZ1EnvXPum5wvvRbr5trNcH8s2Ce25T8yJ0d7rWVMzUr
         mpmwchtcoEEfDXqHlFLNIQyq0VSsGLkzhfiCEFSbsGSv555c1lWAHNVzuFwcoDNQ3UzZ
         TjKlmsvtpgJxQH6XTG6iGyEhzi+C1N3AEhL5g4GXRCT9hY9ghCbHu2mykpq5xEQ0nzo/
         xyeVf6Ye4sPB1NovzzWnbv4qRPk5zbsIoNwEwPDLm6w0xwZ16bGFsu2eb146VuwTIgfr
         k9rALp+M1E+fQflIsHHIJA6EASDQIOfgwdwkJWjNvHRKMmJ82NaNnEuugQYDVXmgb2FU
         Fr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774482763; x=1775087563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8xBD/ObT79//9xMsrPokjqU4w5LxcEClKAdIR9Wy8OA=;
        b=l/iOrGV1FWcG8U5chmkB3AyOo0GEwpX1jnHN2pC5/+LWGteq5WoUO9n3ufwlIv/opI
         IN0MixsVgl1YXkLh1/ETQs9utNpgLRPaZlWZT9i1yiilbcWHnEZ5TgMREtZT/gU+T5Jc
         pODbM+UKDjBeyhezOcHRLblwla2XhHT3nSQ9nwXBKejToK/N6V7a3gmjnQklD2N1sau3
         bYX0IPJrZ4i2NV8oX/45OGiNF5bW60jSWfCg5wwLcijtOoxavlkSkBuV4gZ4W4PWHnvu
         +Av9LHFBlVwEmOmMo+uT34d7z1VDKer/c2PgbH+pObct1Li7Chje1CEMQoubveHwrAx/
         wsWg==
X-Forwarded-Encrypted: i=1; AJvYcCWXvju+luTeOr4xD56tTdhOVcstly9sgJLNTPUP28SoVEhHSSkKImWlp+b7knDwFRs/mbur8njLUow=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7fGx9vR8Zv4PBB5MSCCiez0fn17fnYZYiV3oOafK6F+vYOcOW
	VVRm3t9uSTvvAcXV4zk2eZfEcz4f9VDWOAXFdNPjo3ogc67slPGn63gM7xkeCTjruHWuMXzRyH3
	NiqFbAgDEivqIX6Y5Tdd0aG5Y3gBQ8Eev7k0VaGjzo0w7BKypUkyXvCWA3dmTx0WS1eARLQ==
X-Gm-Gg: ATEYQzx0fzc4PshHTLfYoEIhmR5CwleRjExH0jaoZuxmCoDJXPoraqFvBN6SWOYZThp
	1vbSsckZY0KoeD+sknrwfYkZrO3trjWugB3yihG/eUCxH5bu/wzHkIC63qcSuDbvG04vNhrTp0d
	/Uj3/rM9ZPqNdKGdHo2/UQ8JdCumaOP/yEb7lI0nv7gDP4y0SpLLAOTrQthnrGg7ijUNsX9e3Hy
	v6gNzR6e24gzXFq3Fi7Q7j5eGOyipJdWUVTCmKjigiAjzrwRu0PcIwgJ8exPGp0WOjr5IHGSuCO
	s8/RbDEoANI9OiUVqxJIyW87wz0RI3+cpevBp2tO/jtnV4dQMTNdczFOFWJDkVScD988YoA1gHX
	K34Atl2ih++BsqHaO4e7sSrEJuebwCbx6URKanMCqkrCW0hqbbVwTRO6xRgu1
X-Received: by 2002:a05:620a:4552:b0:8cf:b546:fdf1 with SMTP id af79cd13be357-8d000f53868mr807026985a.26.1774482763246;
        Wed, 25 Mar 2026 16:52:43 -0700 (PDT)
X-Received: by 2002:a05:620a:4552:b0:8cf:b546:fdf1 with SMTP id af79cd13be357-8d000f53868mr807023385a.26.1774482762588;
        Wed, 25 Mar 2026 16:52:42 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d00e501eedsm106346785a.40.2026.03.25.16.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 16:52:42 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 25 Mar 2026 19:52:11 -0400
Subject: [PATCH v2 2/4] clk: add kernel docs for struct clk_core
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-clk-docs-v2-2-bcf660e1ceb5@redhat.com>
References: <20260325-clk-docs-v2-0-bcf660e1ceb5@redhat.com>
In-Reply-To: <20260325-clk-docs-v2-0-bcf660e1ceb5@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3860; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=rXRD/VUBdjTgqVrg6At08VQ99MspomXd4n+3eE8Z15Y=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKPlDpUat5csO2g3aVT2Ttibhyrs8zinlD34WtruL/o9
 vJu8aAXHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzkoggjw+ywkqkXb2lE+v98
 ZHX5219b5VfLpjHkzekXbWv+r3TpwGeG/wmX7ugdsRIUCu7yL3t0xbtFeL6PKltF67mz3yU+7o9
 /wgwA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Document all of the members of struct clk_core.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 47093cda9df32223c1120c3710261296027c4cd3..08b38ec044db7e50c7313b8f44cc0f6fa2cd4755 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -63,6 +63,57 @@ struct clk_parent_map {
 	int			index;
 };
 
+/**
+ * struct clk_core - The internal state of a clk in the clk tree.
+ * @name:              Unique name of the clk for identification.
+ * @ops:               Pointer to hardware-specific operations for this clk.
+ * @hw:                Pointer for traversing from a struct clk to its
+ *                     corresponding hardware-specific structure.
+ * @owner:             Kernel module owning this clk (for reference counting).
+ * @dev:               Device associated with this clk (optional)
+ * @rpm_node:          Node for runtime power management list management.
+ * @of_node:           Device tree node associated with this clk (if applicable)
+ * @parent:            Pointer to the current parent in the clock tree.
+ * @parents:           Array of possible parents (for muxes/selectable parents).
+ * @num_parents:       Number of possible parents.
+ * @new_parent_index:  Index of the new parent during parent change operations.
+ * @rate:              Current cached clock rate (Hz).
+ * @req_rate:          The last rate requested by a call to clk_set_rate(). It's
+ *                     initialized to clk_core->rate. It's also updated to
+ *                     clk_core->rate every time the clock is reparented, and
+ *                     when we're doing the orphan -> !orphan transition.
+ * @new_rate:          New rate to be set during a rate change operation.
+ * @new_parent:        Pointer to new parent during parent change. This is also
+ *                     used when a clk's rate is changed.
+ * @new_child:         Pointer to new child during reparenting. This is also
+ *                     used when a clk's rate is changed.
+ * @flags:             Clock property and capability flags in the
+ *                     enum clk_core_flags.
+ * @orphan:            True if this clk is currently orphaned.
+ * @rpm_enabled:       True if runtime power management is enabled for this clk.
+ * @enable_count:      Reference count of enables.
+ * @prepare_count:     Reference count of prepares.
+ * @protect_count:     Protection reference count against disable.
+ * @min_rate:          Minimum supported clock rate (Hz).
+ * @max_rate:          Maximum supported clock rate (Hz).
+ * @accuracy:          Accuracy of the clock rate (parts per billion).
+ * @phase:             Current phase (degrees).
+ * @duty:              Current duty cycle configuration (as ratio: num/den).
+ * @children:          All of the children of this clk.
+ * @child_node:        Node for linking as a child in the parent's list.
+ * @hashtable_node:    Node for hash table that allows fast clk lookup by name.
+ * @clks:              All of the clk consumers registered.
+ * @notifier_count:    Number of notifiers registered for this clk.
+ * @dentry:            DebugFS entry for this clk.
+ * @debug_node:        DebugFS node for this clk.
+ * @ref:               Reference count for structure lifetime management.
+ *
+ * Managed by the clk framework. Clk providers and consumers do not interact
+ * with this structure directly. Instead, clk operations flow through the
+ * framework and the framework manipulates this structure to keep track of
+ * parent/child relationships, rate, enable state, etc.
+ *
+ */
 struct clk_core {
 	const char		*name;
 	const struct clk_ops	*ops;

-- 
2.53.0

