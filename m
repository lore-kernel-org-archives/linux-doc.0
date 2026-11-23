Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449179;
	b=1IOYzUnmdB7VKyBwa5bsNC6zQqhKy2vz8syweNPedkEN54aAZslgnof5nckQXp4INKVq
	 d9MRcM7sJQZcARjn7Yq/99+mk6lNqtml6vToiYbQzuvEu90ZfePa3ed/BHXB3K3mf9w+x
	 i15vcjqRIN5twdGvUyeYP5wPxjerw3VgHy2DTggoZhlAFp2fXwNs30Z1hFEHKkfhgIP/B
	 gGtBhFSCrLxLH+YkxCAWDS8R2XTLgZvxqAH4hIojB1m2934f5auk9ftERrZ0mK/bTnWzU
	 YucDdYc2DTb0p4F/FsmnbIkvLBy944FA/s5vQr9Loae+X69Wq2fdX+u+ZyekYxnXPqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qj7AT8ixrLnNnl/GUjA6F+5iIJQ7U/GQFRlgi63njZo=;
	b=VPfuWUlKsGmeLp+4+4UcxDRAApW4QSnMMk0v3e3TMvktAQ2UVDwmSiRp4fwwiDjLlyIb
	 wYBlyr1MZoC7wG3GfN93nyJABmpuCPzkP2GcoYnuGDX/FzhjLEU3jcmpRlI2Aa7VLfad7
	 kFAQ/x4hpTs6CYTFZEN/HBwMDRtQUJ/IG9axIXOWjEKR5pTJnFabP6L/+b1JNvgqlWjLK
	 0729mxmqBeg6pTqsahXUF9K3IHn4vzwGDLg1xls/57XqMvJvBgUAOjqcyte1w5C/uA+DE
	 NT1SIt7Kh2w0e7WfLHRPzFSkVy9Si4bJNSI8Ixh4Fd5HHu680TKrm0dUWc833eS5Mag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yJeSvu0K;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692FB606A338
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 15:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 692FB606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yJeSvu0K
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdb684859cbso1940807a12.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 07:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795449178; x=1796053978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qj7AT8ixrLnNnl/GUjA6F+5iIJQ7U/GQFRlgi63njZo=;
        b=yJeSvu0KDqGVkGuiZJLMgzwZfeELxwPAADjmAUBiudoTmUPYZcATBngDtQQTVQImDZ
         Dqb4yVswtYn0tTK+iV/BZ2s9uxMRhsrEHBwaahSFFMYSjPwdxsYo/0l1LTJyGXxl2N2Q
         T2kSwBxh8sM+jM1PApNBp+3wxwuG3VeKt5Uwi9gXehSYENd8nMiior4+ruVYo5m4hWlL
         Fg/ZbIbgrxYnQsCuxjLeO09pgl3NldStquz4OnS8tbKVPo2+aGSah4mpVw+H3lKfOXYl
         3tnxEqWGLp2B163Rxs7tSC1jDzneddAemCIFSrdmpUIMgTHJNg31PJVbKaKeFERjtUk0
         7BIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449178; x=1796053978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qj7AT8ixrLnNnl/GUjA6F+5iIJQ7U/GQFRlgi63njZo=;
        b=qY6/Nlz4d6nH7kRVQTl6fnv4YOFPZW8HiB+liDWu3oNbUTVyQ5mVjD4a/N7qyByFnX
         dkakJW8GgRmo9DkWE7S7Lg+BLg+vK9CFXIJpuE9qtpgq9g3w0/FSq4pbDgbE8+B02SX7
         W1TrsUG6MDQpTrxOhdgNh9AnECxZAXg1nRfNJVrqBCqUC3N1/5cLOodZRYaZ311BoUut
         D16/e4xSyRMYqxst0f1Nx7twBTgdsKDHdAuPXZoAoXmP3CuvPgLrl4Yn6OrVYD0MWBZy
         WODXS7c7DV46aMvt557r7Ht2dubECmaEaUTBde7EsRYJ464FwRJiTpcaL+gXK748Q/r+
         2+Qw==
X-Forwarded-Encrypted: i=1; AL+hErHAWZRo2q8MlrPok4Mc/JXQPrixhyqljSDhrh2QNDcbMG5AEMwQQ3DkD+fwUfupSw7WjMFaI0k8V1s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HIYixXTZbg0bF2XdwYwZm+J/SBj5WFiXOqWcVOfqCpzhJ0Pw3
	peJ3lq2HvEGCQpo4xf9NfxwUZsn48udrLEUwrKdqqffFC9dhSQy9kCV5
X-Gm-Gg: AZFdTZePW/WW2gtdduVhpJQvJDB5CLbh5Bag8mLpcgeC3G7U2j6JFpu/Wjs/hndMySB
	icMaou/ZCVlumQYvPbJ8Sag73DRCyj3l4xhPkcn4dW2/Rfo45Sun/7eKnsJXoSmAiOZrHHXECYK
	v4s8fP5S6PBLHmJL9w7FDgcze5V4KD6LWQZmAx0F0kGEl6+zpSFiXDKYfqeZu/Bc8n+URHg75bt
	g5l85vrh+4epVJH+hAaOYGxvRKdnqRk48KTKca47/fzm/2Q/aAG5WInMxxREvUtTVwYp3Krh5XQ
	3YAxXkHnatF9E9FXz/T2lUpSTNOlfF5tHEh+3iW7X2acZeQEGqPFKrRJib6D08e10+6EqVZZjHW
	BAtBbjEumXmM9y/4tJ75hGPpvaIMTtzgeR1l5K9e+mIAFCAD7NKnoGAK9cYoq+BV2mVTvTh2Fuf
	G/NMQ4JFiavFtU6mqKbfTYr6NhIHat2RQqDf7iUah1nhn5Dq/PfpyGh1lmNLgyZyzywjo3SvqzB
	VHK5c3NQvgadJdCd8wk+7xnMEXR1T3vIBDxd0BbhHG9uVdL2hyVByJqEkRKK+QeQVU8ex7ULO+c
	sGgBAOGw/UFgzuS/2E4xWeR+XuXLlkP9exF/FwbeSHA=
X-Received: by 2002:a17:90b:2e4b:b0:3b3:886d:621 with SMTP id 98e67ed59e1d1-3b41c9e52bamr10518041a91.34.1795449177600;
        Mon, 23 Nov 2026 07:52:57 -0800 (PST)
Received: from LAPTOP-G6J9COQB.lan ([113.11.180.16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d96bd3sm21596601a91.12.2026.11.23.07.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:52:57 -0800 (PST)
From: Ahmad Wicaksono <supersonix03@gmail.com>
To: bpf@vger.kernel.org
Cc: jakub@cloudflare.com,
	mhal@rbox.co,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	davem@davemloft.net,
	kuba@kernel.org,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	linux-doc@vger.kernel.org,
	netdev@vger.kernel.org,
	Ahmad Wicaksono <supersonix03@gmail.com>
Subject: [PATCH bpf-next v2 1/2] Documentation/bpf: Update sockmap docs for mutation restrictions
Date: Mon, 23 Nov 2026 22:51:59 +0700
Message-ID: <20261123155200.16676-2-supersonix03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123155200.16676-1-supersonix03@gmail.com>
References: <20261123155200.16676-1-supersonix03@gmail.com>
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
bpf_map_delete_elem() on a sockmap or sockhash; the verifier rejects
them at load time with "cannot update sockmap in this context".
Commit 18f6c47d1097 ("bpf, sockmap: Restrict iter-context sockmap
updates to iter/sockmap") then narrowed the tracing case to programs
attached to the sockmap iterator. The kernel-side sections of
map_sockmap.rst mention none of this.

Record which program types may still mutate these maps, and note that
sock_ops programs may delete entries but have to use
bpf_sock_map_update() or bpf_sock_hash_update() to add them.

Also drop the reference to
tools/testing/selftests/bpf/progs/test_sockmap_update.c and its link
target. That file was removed by commit 5de7a6eaed89 ("selftests/bpf:
Drop tc/xdp/flow_dissector/socket_filter sockmap mutation tests").

Signed-off-by: Ahmad Wicaksono <supersonix03@gmail.com>
Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>
---
v2: Only sockmap iterator programs (iter/sockmap) may update, after
    commit 18f6c47d1097. (Alexei)

 Documentation/bpf/map_sockmap.rst | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/bpf/map_sockmap.rst b/Documentation/bpf/map_sockmap.rst
index eb466b86d..0b7fdfca3 100644
--- a/Documentation/bpf/map_sockmap.rst
+++ b/Documentation/bpf/map_sockmap.rst
@@ -287,6 +287,16 @@ The flags argument can be one of the following:
 
 Returns 0 on success, or a negative error in case of failure.
 
+.. note::
+	The verifier only accepts this helper on a sockmap or sockhash from
+	``BPF_PROG_TYPE_SK_REUSEPORT`` and ``BPF_PROG_TYPE_SK_LOOKUP``
+	programs, and from ``BPF_PROG_TYPE_TRACING`` programs attached to
+	the sockmap iterator (``SEC(iter/sockmap)``). Other program types,
+	such as tc, XDP, socket_filter and flow_dissector, are rejected at
+	load time with "cannot update sockmap in this context".
+	``BPF_PROG_TYPE_SOCK_OPS`` programs must use
+	``bpf_sock_map_update()`` or ``bpf_sock_hash_update()`` instead.
+
 bpf_map_delete_elem()
 ^^^^^^^^^^^^^^^^^^^^^^
 .. code-block:: c
@@ -297,6 +307,12 @@ Delete a socket entry from a sockmap or a sockhash.
 
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
@@ -351,7 +367,6 @@ Several examples of the use of sockmap APIs can be found in:
 - `tools/testing/selftests/bpf/progs/sockmap_parse_prog.c`_
 - `tools/testing/selftests/bpf/progs/sockmap_verdict_prog.c`_
 - `tools/testing/selftests/bpf/progs/test_sockmap_listen.c`_
-- `tools/testing/selftests/bpf/progs/test_sockmap_update.c`_
 
 The following code snippet shows how to declare a sockmap.
 
@@ -497,4 +512,3 @@ References
 .. _`tools/testing/selftests/bpf/test_sockmap.c`: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/bpf/test_sockmap.c
 .. _`tools/testing/selftests/bpf/test_maps.c`: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/bpf/test_maps.c
 .. _`tools/testing/selftests/bpf/progs/test_sockmap_listen.c`: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/bpf/progs/test_sockmap_listen.c
-.. _`tools/testing/selftests/bpf/progs/test_sockmap_update.c`: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/bpf/progs/test_sockmap_update.c
-- 
2.43.0

