Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675720;
	b=M1ZIgW3auD1qcO+YZgOT1RFPSZuclY2KOZzqP769wVqHFIsHNzhm8kDeQ2+Ib+r6v0Xv
	 xVW/i2Q0GgSdpxPrzCp1w3J1sagS/CDrCdpPQAPtFVWZ76gtZEreJJVv9aGqQnZqmIO8l
	 bEDju+1bLtJyxcyBDjf/ThsZ/1Ey8QxbdNNWlj2V4HbeVAWLz5iHaU4AzyJetwEiQZjTD
	 pujGkBnBJB5Lplop2fmUrX9Y7dDM/YPnIT8DAHRT2Pu6KVoktPcvf5FvATM5Rj3xX6QRc
	 aAL510UU6j6Qo8mgZwW/GHt7bh2KjboXSMMzRsxNopH6u3e6lReXYFXElr1VVO0Ty3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FgLmcSw7DjbpN264BqldKH5klMuyQXGFQrNXp00hHzA=;
	b=HNfav8/50D5GL9XAL02KjNo9CuqeR2q9MQZ96iTOemAj96V6kU663vN2gpZmE2yHrUwJ
	 ihMAwTnc0h7jzGoPgpPBzfZz11oFgHYknJE4gEXpk90Vd6Vk36Fd9FYmKN5dIXdr9Mfpi
	 1NGJBefD1O7a3P55cwg5IHjvp2qyCq5SaUXScojjfGpFnYqTaq/UKAM752py/TWwncrzg
	 76uGWk1kpWBH9H2cluvNe9jNWD+8myyLi3Ff1mraUlzOjSab+o9St9kBYunDWc0iP1fa1
	 fJgAOl04FYvHJzfhBZTJ330C86+77rUXRZmIDFGTGy70AlTL+BIabiiZhf5e9YfSpFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uyhFkfCj;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA1D606A333
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 17:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEA1D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uyhFkfCj
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37628596783so3577252eec.1
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 09:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794675719; x=1795280519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FgLmcSw7DjbpN264BqldKH5klMuyQXGFQrNXp00hHzA=;
        b=uyhFkfCjuPWNaTUSZb+7Pt39iHkDpbSD/kPp0aQyJ8ktHUMZ6h8OMsQQkCiQX2VaK5
         gqAVfl0CYdGk6TzezMRtPpodkH93rRRHnOQOy3/X4WfrQMOiveI2jodhyBAlEGu0wEVn
         yRuIKWJyOxCkzS5POr10C0Uez94UN4VRmqrPbs7GOAQtGsMz0T92HeXrIhjoLwh/wrms
         tXwsZcLvOx1EqO6X8y+Y+ejjyp5GcBFzwHKFkruA7Jtw7keuZNecJqVEc9FbOSkqpBr/
         CiwD4nRtx/q58s1zcA7vrRO/pPz6y9mllfh64NNmwX7gU/t9HUj9WG9AJIQS94FlS4E0
         u7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794675719; x=1795280519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FgLmcSw7DjbpN264BqldKH5klMuyQXGFQrNXp00hHzA=;
        b=o9NlHv2TgzM2VECwp4bmfuWlqrvTXN072FMBLeLmBilTfn+f1W9m5HEsZs4yoEe/+g
         Z19WY0VLz0rVvHlqYevg1ZZrJhP2rs7mRmMoMucsEEPnbb7mqt+abOHZbD6DKT9Y4ZD8
         W4l1tzgj0fkrTm2CLcdFMr2+ia5CjwLzke3ghJWIREFEdSGTHSOouYRICvt1SwElehw8
         Jnli3hBvNcxfNG0KbW0kkvOlV2/rLt4W+RKCXz+TjujyAC4/BvCrTIt1AHH4v0/6gEW6
         TfN6Q8rpiPI/2jbVugdFsgvrvcqlG7HI8tVT4F87lkRP93iXQvpiUTLDN0kY84Ueq/Kt
         rkRg==
X-Forwarded-Encrypted: i=1; AL+hErHCz4dijCoVChjb8OYCfIZPv70/2vT5wwdvKauy3VfLACng8CGQJXi12rMrG+oQL+4lB2DPcddgDEY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ws9+YgY9viMnnG6VbR5NTTbkcBG6b6JJzqZ95zTR1nn4v6Yv9
	n/UKFWuBtHK8d6K4zNNI2BCin0a2DxipUGhnfoTGsbXYMQpKH2G+s25Vx5p17BYy
X-Gm-Gg: AYBFou3/uKHE4NMg4V4Ndv/VtGtgje9DSHEadaGjVocqV3FFGo49UNcoFIWgkdWvsZg
	Uh2ezOhg3dHbUJ9syGOK4pL5ZfpUhsjt+L5oDLdoh+Qbog/NF60wKYb6skVjZJ9FYkzBiKdEr9C
	B0Sh2s/7QyacorrS5k/5wKAvJXXNZKgzubJHywJotpB3NxyQoeBKL1asEqVWk10B6KtfO3yzvLn
	fD2FPGTwJoLTtzcFxFL2AnpckcRlP64SwelEto+rU/xb5YPTkTFqMISmSNKaSHg6ZiWUDg4mJnK
	J7QuXq3vIioLNoG2yC82OAbtKYdeKJbLb+RMZx6VgjbWcuKyosLPuHvkA8R3v+ahFIFMCPd4ZZa
	qo8AnfX6vjmjEKXZMBemFrQTGduGOu+a0477XJTSnI7uTsqR3ZPhJNr4J3FHyf/gWG+L49KbCYD
	QvjK33Ab4H2Qp3e5PzBuQ7/0QF7DP5bTONnCWnk4Z0mdixdvtVpZ5FLgKLhlRW/kDt4E6ZLGGzf
	JhV4Gafve3lMi5OvzIaTmmAKbQgSzuK+vencYeDD81Cma4+sRM+j13P/QCyPLOKm8s8pSf/vvYS
	DIk46JK9U6jr8Cynrg5HdA8Fye5P1Y0rhGY1QCPIg1M=
X-Received: by 2002:a05:693c:4152:10b0:36a:4a68:84e5 with SMTP id 5a478bee46e88-379659c6839mr6140556eec.8.1794675718555;
        Sat, 14 Nov 2026 09:01:58 -0800 (PST)
Received: from LAPTOP-G6J9COQB.lan ([182.253.124.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm31586761eec.21.2026.11.14.09.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:01:58 -0800 (PST)
From: Ahmad Wicaksono <supersonix03@gmail.com>
To: bpf@vger.kernel.org
Cc: rhkrqnwk98@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	john.fastabend@gmail.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	Ahmad Wicaksono <supersonix03@gmail.com>
Subject: [PATCH bpf-next 1/2] Documentation/bpf: Update sockmap docs for mutation restrictions
Date: Sun, 15 Nov 2026 00:01:16 +0700
Message-ID: <20261114170117.196552-2-supersonix03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114170117.196552-1-supersonix03@gmail.com>
References: <20261114170117.196552-1-supersonix03@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit be39165224d0 ("bpf, sockmap: Disallow update and delete from tc,
xdp, socket_filter and flow_dissector") dropped those program types from
may_update_sockmap(), so tc, tc act, XDP, socket_filter and
flow_dissector programs can no longer call bpf_map_update_elem() or
bpf_map_delete_elem() on a sockmap or sockhash; the verifier now rejects
them at load time with "cannot update sockmap in this context". The
kernel-side sections of map_sockmap.rst did not mention this at all.

Record which program types may still mutate these maps, and note that
sock_ops programs may delete entries but have to use
bpf_sock_map_update() or bpf_sock_hash_update() to add them.

Also drop the reference to
tools/testing/selftests/bpf/progs/test_sockmap_update.c and its link
target. That file was removed by commit 5de7a6eaed89 ("selftests/bpf:
Drop tc/xdp/flow_dissector/socket_filter sockmap mutation tests").

Signed-off-by: Ahmad Wicaksono <supersonix03@gmail.com>
---
 Documentation/bpf/map_sockmap.rst | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/bpf/map_sockmap.rst b/Documentation/bpf/map_sockmap.rst
index 2d630686a00..8bb6d74cf36 100644
--- a/Documentation/bpf/map_sockmap.rst
+++ b/Documentation/bpf/map_sockmap.rst
@@ -285,6 +285,16 @@ The flags argument can be one of the following:
 
 Returns 0 on success, or a negative error in case of failure.
 
+.. note::
+	The verifier only accepts this helper on a sockmap or sockhash from
+	``BPF_PROG_TYPE_SK_REUSEPORT`` and ``BPF_PROG_TYPE_SK_LOOKUP``
+	programs, and from ``BPF_PROG_TYPE_TRACING`` programs attached as
+	``BPF_TRACE_ITER``. Other program types, such as tc, XDP,
+	socket_filter and flow_dissector, are rejected at load time with
+	"cannot update sockmap in this context". ``BPF_PROG_TYPE_SOCK_OPS``
+	programs must use ``bpf_sock_map_update()`` or
+	``bpf_sock_hash_update()`` instead.
+
 bpf_map_delete_elem()
 ^^^^^^^^^^^^^^^^^^^^^^
 .. code-block:: c
@@ -295,6 +305,12 @@ Delete a socket entry from a sockmap or a sockhash.
 
 Returns	0 on success, or a negative error in case of failure.
 
+.. note::
+	The same program type restriction as for ``bpf_map_update_elem()``
+	applies, except that ``BPF_PROG_TYPE_SOCK_OPS`` programs may delete
+	entries. Other program types are rejected at load time with
+	"cannot update sockmap in this context".
+
 User space
 ----------
 bpf_map_update_elem()
@@ -349,7 +365,6 @@ Several examples of the use of sockmap APIs can be found in:
 - `tools/testing/selftests/bpf/progs/sockmap_parse_prog.c`_
 - `tools/testing/selftests/bpf/progs/sockmap_verdict_prog.c`_
 - `tools/testing/selftests/bpf/progs/test_sockmap_listen.c`_
-- `tools/testing/selftests/bpf/progs/test_sockmap_update.c`_
 
 The following code snippet shows how to declare a sockmap.
 
@@ -495,4 +510,3 @@ References
 .. _`tools/testing/selftests/bpf/test_sockmap.c`: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/bpf/test_sockmap.c
 .. _`tools/testing/selftests/bpf/test_maps.c`: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/bpf/test_maps.c
 .. _`tools/testing/selftests/bpf/progs/test_sockmap_listen.c`: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/bpf/progs/test_sockmap_listen.c
-.. _`tools/testing/selftests/bpf/progs/test_sockmap_update.c`: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/bpf/progs/test_sockmap_update.c
-- 
2.43.0

