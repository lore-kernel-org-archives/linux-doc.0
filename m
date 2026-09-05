Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB49233943
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 09:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788602136; cv=none; b=lOKmEKoEVQpBpHvG5VQRW9W9IjWd6D+ea2danMYUXOTlrNRspD16jrtIyrTwniR+8gNqh2nQtRrsLkuLQ/GU1MFu3E9f4fJfCdUs4d1vuXpD6DBctTj05A/L8Jj6hPB1dUWqMFT8cG23PRdY5PD24JtnYAd72BjCEWep0chMVZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788602136; c=relaxed/simple;
	bh=eRQAAXlWAMROkoD7OBw5ouB2i6O1eypSFuIjNF/KGNU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oguZxrGXYAqzReP6MogoUjCpHoQ8x8binWdQxKWo+rA4B0WRrXOjUulZDIl6c8c+VDeUR4XfCVkRVnzsf2H79zEvK0aBaloP6UbkmfOHOchRwMwNHnG/k61JV47TmYxEFa8d3tYMWUCeozESQBJAMbCfo/3SddIopTWhPzGXnA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G90UtnqV; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G90UtnqV"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so23848095e9.0
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 02:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788602133; x=1789206933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uinq+jcxQ1Le4rWdm3YmLWDbX4aGYVSl5HMyLui+hkg=;
        b=G90UtnqVLKjal8yi294rsHIj+3GB0u/VHCLm0Y5jO6X+r5W9d4SIWfH8tn6ywdUi5k
         CrFAQxpH7jvDvsBf/cyb8Csjd3NtLEzcwn+4SfwTJO/gV74Sk4Y2/gCoL2swne1Ltwt/
         7QEI1l0Z8RPijvWc/CnKr+/MsMrdqC+Mg/q3tHeE6FOt8RHazYJ21qFtbxtzyVGzNHg6
         JChk2InpPHbaEtH8HigA70LuKgbTAZiBJmMQambRnDCXAL+5NXMCpnzhQ63qh8wlPCoG
         q+IjHC12ZtPDDJUn+NN+gdrqmF1rjF04iDcFtGHwODjTnt2hl4nrtXCRpUNg0No5dx0a
         b7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788602133; x=1789206933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uinq+jcxQ1Le4rWdm3YmLWDbX4aGYVSl5HMyLui+hkg=;
        b=XIvYl+WadBHj3QWs7LwOS15HtitUVd4zgnr9tWZjAzECzsOyi9V6rL6Jd/Vl4Ckris
         6OSS/KTnufg9VOKVwiF93mHhhxb5lvxOopP9vSweJQLU0/6bwkNz4NiT9p943FTwxItL
         C7MMo7DZ0IgXhS1dz/zbG1HqGhfOktDFwXynoemReFAyaw0AUH7NVQ8f3m5j3RIhyukf
         Kg+3yZ16TnqocKKqmNCbcQ4lCb75fudXhukaLJ715wSSNCiyGybwfHqaYae74L/v3Wky
         IvW8Es0PN+ZiiPH5hpk+/G/meAar0CPoZmTZuJPlb5PSMH5twiKEwJiflKuaatQ5EASs
         bufA==
X-Forwarded-Encrypted: i=1; AKwUvBye2ERMydGU3bPqa5Ofza2djdR0FcPj8Z9OMbcxAreXXr6Nn7ZkH6rcAetcrPzuj4jRSah0QeBEqr0=@vger.kernel.org
X-Gm-Message-State: AFuF++maA+E1fVidim/cDSDEbud1+pUvBz/sWXiyzTt0ggfMHtQdODMQ
	XxiPbOfd1/uUPnrpiVAP7MhGLCk5NnfUEWT6jUAYdD31a6tEolVe4gKY
X-Gm-Gg: AYBFou0gnucpeqJxUwASU4bIY1hXl+RDU5NWAJ1xz+4sIZ7wvZHE0zy0ZDPL+drsegg
	UARD3MSB8P8p9VFFaUWRgbnsRcj0TEPGGVArr9yZjT1Tq4xHQdVYy71SLw0smQgtn9QfMsUmo5Y
	Orh/vB7vdaJZah+jHezrBwuJJjchLIHMdLnuby356m5Acj2GXaZ9PPUQ6tFWUaveJZhTVsg8zpL
	+Y3F5k8ncknxLupL+QHh72CIV99XYKOsdszaw7arwtNWTFoqUrnPXq74uI/FbGs1AVnbwiTxEta
	ZiheVOPBNbapc8xdffGqgFcUYYtoIR0zUvYnzRR495xJA+VO55y0T3eD+f7rB2u7rBoGMj0q8WX
	nPOKjrLzQwqVsn6+AzFEkQPf+omIdBJn9vwkArgJfe12sBhMa7apkTKqJ2az9SAakzMs8vV29Op
	NFW3KyFp5lg/1u0DT4xAup2+yhTvHyL8jU8VaQSeKmm2tD42c/7U34TQBG/gDmRGyz197dnvCXN
	b0UiPgqeCfB6C25skuqVXTfLWPsiUPd7mnJVXHkFloBJG9i0ni5ItVzocFvAojGrogiXUxPChis
	Vz0bPKO9tRfeK9lqyoNkj2YPYygIRlGJcDjX//Obv7OuLMu1LI0rYKialk6Apw3nXEM=
X-Received: by 2002:a05:600c:3b8e:b0:49d:7f5:4cdd with SMTP id 5b1f17b1804b1-49d07f55332mr5523515e9.27.1788602133188;
        Sat, 05 Sep 2026 02:55:33 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm135325035e9.0.2026.09.05.02.55.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:55:32 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	bpf@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	David Vernet <void@manifault.com>
Subject: [PATCH bpf-next] bpf, docs: Fix the struct bpf_cpumask name in kfuncs.rst
Date: Sat,  5 Sep 2026 11:55:27 +0200
Message-Id: <20260905095527.42261-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct bpf_cpmuask does not exist; the name is struct bpf_cpumask.

Use it.

Fixes: 027bdec89364 ("bpf/docs: Document the nocast aliasing behavior of ___init")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/bpf/kfuncs.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/bpf/kfuncs.rst b/Documentation/bpf/kfuncs.rst
index 85f73e0bbd0f..57831eda0a33 100644
--- a/Documentation/bpf/kfuncs.rst
+++ b/Documentation/bpf/kfuncs.rst
@@ -536,7 +536,7 @@ For example, for the following type definition:
 
 The verifier would allow a ``struct bpf_cpumask *`` to be passed to a kfunc
 taking a ``cpumask_t *`` (which is a typedef of ``struct cpumask *``). For
-instance, both ``struct cpumask *`` and ``struct bpf_cpmuask *`` can be passed
+instance, both ``struct cpumask *`` and ``struct bpf_cpumask *`` can be passed
 to bpf_cpumask_test_cpu().
 
 In some cases, this type-aliasing behavior is not desired. ``struct
-- 
2.53.0

