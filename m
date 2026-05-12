Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BF0296BBA
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 01:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778549744; cv=none; b=indJrzrg8OYQvPhqeCct12x7ABOXEYxecThW3qgmipfBMAFk0fuitBWKxuz9u9PXY5wbD+wSI2lkbZ0Uqa2IAoT8bLxAzvxjsrtkDWUJJ7RGiQ+M3qKLpz2FfIchAxU5c06e+vBUA/aDzEd2vjRkU/GwoxMzsPNP5pzYaeH9r2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778549744; c=relaxed/simple;
	bh=jTrBLk1qWkVHCmc3+UYIHvnHjmNTUClNGQ3B8tv7dsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bI3nZi15AgLCpCuOIHLzIOxdN4P4e1m5xmp88cw3hTkKK/z+cd/O3BeUsEdP+6bEqBihQDee7cYKmwBKS9SAYRFDJOz0QuiuNbnLesCInTir373JIWgSUScfLpFpuJ7xbcH3WJwjbpXni+rcb5bQYAmnnC56luxZWRM+qLTjr7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FSB0hSLj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oTKP5UEg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FSB0hSLj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oTKP5UEg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778549741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HmY3+GxwfazDrDrdiT8VzZ8cqwFuEeiFZpdTxM7euIo=;
	b=FSB0hSLj4nCz+2bD7suPTq9LMoe7VkpJ2/5bIga6+uuGchdxT+j+G/7xu2xc+loweV7tOM
	NMbjHB++w1QtaOpowwb9qKelH1UL9218dhhOsvfyHxnbRQw7/tht/I9FDerbDBadaFLVUO
	FT4vR9U1W3UGO85C3A3bVt0EErMpVo0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-4HOr7Wd8OROvhklhlEWCwg-1; Mon, 11 May 2026 21:35:40 -0400
X-MC-Unique: 4HOr7Wd8OROvhklhlEWCwg-1
X-Mimecast-MFC-AGG-ID: 4HOr7Wd8OROvhklhlEWCwg_1778549740
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8b513f57611so17231446d6.2
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 18:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778549740; x=1779154540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HmY3+GxwfazDrDrdiT8VzZ8cqwFuEeiFZpdTxM7euIo=;
        b=oTKP5UEgfTpApU6HSSyPIg68D746s9w5dJ4R68bmvP2o9JfMvwTcbjKtyJHmm+OkMK
         5oJQl2iG/3hBekv0ziyqBZNKtGZnWr0iwgRuelal+q4h3Sb6VcPxbd/itFbCaqaQHA4t
         9fwaN+I0p/l5z04lbT3kG16vUl3rckDER/SVXZ6LOHzM8koUNLeYhngTAnDqH6jlQnuw
         +Rpu2JX2JmMM2N0lAz756YW8raeodXdUG+1ex+GO0NvCgcPdnqt4F7W14zF7FyDJmvmW
         EaimJcNLt2s+SPEkBDcv7s1QCLQjHNusX7iUxPeVhR7v5KbttiMJ6TXBRBCrPQ5eG3wl
         g89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778549740; x=1779154540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HmY3+GxwfazDrDrdiT8VzZ8cqwFuEeiFZpdTxM7euIo=;
        b=JCCKrmOm9jKybu6LqaVxcNZFKNO1vn9m+U7o0RBdqWqqUeV4kE27Z2FcL7EBqllB8Z
         weqL+YIxLtLCXVKP+kWtFfw6UJQT+QKs4pz0bslHawHBjmOqmKZYdct3NEoEZQU9fjXi
         UpfpD5cHwarYdLiTTGmiYNprEQfQv6/cPY6EkODo3pRpkewlFA6xku5rL+2cCccKiK4x
         3iIsE9AE7QuClcUGFEL0OwadE5daXYEgEcZ0X9IjqsldSU8KsarrDrE3tzGDJzLNoahl
         /at9mM65OyQHxIXdIgryjHSMqnSdN01q9BVbbrCJ5Ex7AkEagnAV0HXQa2hKG6T7Z9zt
         qYlw==
X-Forwarded-Encrypted: i=1; AFNElJ+uA73zFrbfGvat9xxzch2JIkSJdq2vWn3PHa89aGgetqp/gN3VPeP82s+b1vK/L2U/HO464k8qxsE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdqjn52g5Q5IFxpQiRdabYdDgEOyD6qO15v71OyunLGITr5csx
	6wsUU2Swr/aFpqr/086kZrybuTN9B48jbagPL1Ie7oikzKTslAU7vL9m7BCz6pGQzs6WHKNWOpM
	YWbYevmDdDwFO6eCpwO/eoZfHeWxWJAA8MMHBqPp7MdSvjx0Tl/RE6D0CRilV6A==
X-Gm-Gg: Acq92OGV/DVsN/1MJDDfq5r2D1zH9GPCB2NGzJ1pWB1tyAD7txN7Tc5y2bYmoDnLl5l
	iqhGpWav4QMip5na2FZAAuxh91dwAxXp+sglD7TWUdsOhMn+s03+vTU38X/yK8+O3+ZMv90FBse
	cLV4202h85PTAoxVPYkjCnNGWBN7DX1koS884J0nJvnNm4sYoqLCMfpd5k9amTzBYfmsR+pyj+0
	Sa1ZsE6JdZnBQf3QFrvH/tKEkEa+5fZmbJeQkZRgH3hOJznyDhwJi8MdAJEoYkv/wTj/VBr9fXG
	omVdWahc+32NiJk1KugIApbINOPHKOOqfyTctQ1FGzjvku1OBQ1wgOLmcvDZLhfZf7k7W3pH/EQ
	blC7Pi5upQUu4B7MXKlTlL6WiQM+kxfzIk2F2cLYAt94e+ZG+vzIDNWAM3Fsqlw==
X-Received: by 2002:a05:6214:2aa8:b0:8bb:2e70:7a2c with SMTP id 6a1803df08f44-8bc43146784mr416115366d6.13.1778549739631;
        Mon, 11 May 2026 18:35:39 -0700 (PDT)
X-Received: by 2002:a05:6214:2aa8:b0:8bb:2e70:7a2c with SMTP id 6a1803df08f44-8bc43146784mr416115016d6.13.1778549739162;
        Mon, 11 May 2026 18:35:39 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf39c7e2e5sm109704006d6.34.2026.05.11.18.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 18:35:38 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 May 2026 21:35:05 -0400
Subject: [PATCH v3 2/4] clk: add kernel docs for struct clk_core
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-clk-docs-v3-2-ed67e1065809@redhat.com>
References: <20260511-clk-docs-v3-0-ed67e1065809@redhat.com>
In-Reply-To: <20260511-clk-docs-v3-0-ed67e1065809@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3804; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=jTrBLk1qWkVHCmc3+UYIHvnHjmNTUClNGQ3B8tv7dsc=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKYmp9e0buTk6rMK/Js7rLjrpeLpoZkVbp9MJtf3lUhH
 7vpAnN8RykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABNhlmf4HzHNcqfo5kk3Tfv+
 pSqduyK70e5/Ap/3smghOefbs3V8OBgZThxc8511zQz3vu0SUVv35uV6qk2Zq+m4MyXBqWBDdkc
 0IwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Document all of the members of struct clk_core.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 048adfa86a5d..0b519d95bbcb 100644
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
+ * @flags:             Clock property and capability flags. See
+ *                     `clk framework flags`.
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
2.54.0

