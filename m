Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543165;
	b=eUij0pAXW/HDR2PnCfgz/eVqcaSbxV5qN1e82R4nsGHLwZY5oRwAyH+PHWzlNp09m7Xv
	 KRn0CHAzgoWABCZUoGri8cWgRoptTX2dvRh+/slCHlGfWtJLMQTnxwfYOqSRnC+zTSCgj
	 oxsTfrR/sd+t5GqnamSSPKGbHYh8OmudbX/ZqrP5DZ+1BT8QDltwo3DG8zB12eF4I6rA6
	 QiNdcrz7WQxaR0OnjhVfHFEygsi5VtUhzpwyY+byb4SecaL2riN0x74ltp6+kHFwDAZ+c
	 TEIvbNL98EkJg0WQoOuaVNVIXE0s+U6pY+yN1O1byAscrMnK/kBSewijDKa2i4i02VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pcVobQ6pdsPePLIZ/BBz4G2XF5J7pWqm1D1h7L58vTo=;
	b=xoFPsanM9Q3bvpkdXgbxolq1OVf2/mzZByX1dywUJ7Z8I03JzKhNmx1whFgC4VymYH67
	 8I6aq79MsaD5DAXp1UREuFUO7TdpFCoDXbEAgf0zyN8IiuIIvRjbarbeX3FaVr6a9e/HT
	 QTHsIM6/1ISUYxZQVtWnkptAXOp8tmIzk6HPuMqmR4z8n+bRKtPvF0hGNkQC9hnu0pTq8
	 F+qZvH0/ass8WwsJsVeOpt5fYQ6fqNUec5Ar4zQO2pdYB/HWqd2bagIIOnu3VagZt6TQP
	 a4HcOv7/NWX7fae+VYKSio/ohA8K7m2++bOZ5I7AL294X+1YRuiFl0kbC9pCaBaLrvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=RbQ6T5Qp;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF99606A327
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 17:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AF99606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=RbQ6T5Qp
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6bb06dc1fffso1177506a12.3
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 09:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795543163; x=1796147963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pcVobQ6pdsPePLIZ/BBz4G2XF5J7pWqm1D1h7L58vTo=;
        b=RbQ6T5QpLfALEMfapC5vQwcS0KOt/80cKI/2Gi7pbzKqt57N/lz4lsvjiO6176/M5M
         TWg6bDy//uuYAiZAxssulqNVo60OUaUwbHvfj0ax+USx+esigVyk1vwIoSEhNK+UIJ5f
         jIurNhrr96uyUte3jumNHscfFOZaMbWeX7dNat3a3eIQVHB2y7/5100sAMbkDFRBC3af
         1Pn5M1NOvXRgQRdFSvNd9co/c+ruIMEfqA3eLSUEppGj5kp75CQeK7qSL3Ihn3RTV2oT
         V7kNRFOiJxn5uzKSAFyASfDFNgMelnUJ/7VFpnHn0p5yW91ARf1OnBBPYjiKAga36h7n
         oQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795543163; x=1796147963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pcVobQ6pdsPePLIZ/BBz4G2XF5J7pWqm1D1h7L58vTo=;
        b=afN17+aiyBgUeczY+Xvf9yOtGuByZ/O/SLnZeKxKm7fyXriA6u7xp8O9rgzniL0UO/
         c3cnAxP6q/3hb8SvAidnJGEtqnCjbl524n8LZNhJDqSLabhMscT4Jw+wwMm8us7LyRvb
         ZlnUJ8Z/AGyllbRFn1oeh8CsmNQh0kxivgHxMhhJQPPwrMz2NFx3cjwHXUT0f9fMFxBB
         8YWwryAX7WMOLfJdn9JYBDD5UBmhydZcW1jPLRHgNqlsVfP6b/Ywg4KUB3L+xkysZeP0
         tEgqpUzxxtCDCw/nx0DHTvUJv0fC3qT2IrmaqvmkXTjm7IbO+Jm5uej8m/uSS+l5QupX
         ctgA==
X-Forwarded-Encrypted: i=1; AL+hErFHEUFF5H5aBg3wWf5RGXTmJGCjWZadSankhv2qMRgf3HZyZHTs+/nG9meLMWTjm53vkfgdZYWcFBQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aiRdfrn1vDnoOJfQLrd8o3OHRa5/64QG1N7K3ERGGPVmRqPPS
	/rz4K8HhwwaIkX9VKBUedfAJQbuP1wjapGn1aGcAuTTVWch/Hi1bb9z19hgvpHOIF3A=
X-Gm-Gg: AZFdTZfNxS9KPxMktghfRGFF5nZ2HhRvxf2Bc2Pj2eJ32ZvKG+ph2V/S5oQeYL4nKvw
	k3OJqY2I9LXXig/QQ4BPiEbiDXuJe5z2CKb6yFJijrCGEU9WU3RvERXLj2wA7OtW4OrjgFLGYWD
	Hgc1h0+7XETVs1nBfENtVMIKkdimvHG07MLPvkbQVmEYSv4Aa+HmSiXczvW3RNazL1LSH/Lvndt
	rb2jsOpI6arSKcs9VrETfMKw4YHghZMtWMJnv59CJ6Akknse5xtCVvrKeB7lagwvatl4VDBAouU
	xpLUsZXN9Q5q/IdvxLnA5JjrzNsWilfkpCW5/XwvG0DwtyPLt7cXJX0ogc9YmayY2ZjVHq5uop+
	uvjrfdmT58R2aHxUX3UURpsZoS3d5XMTGC4QWE9Y1mu2c3NcXeYhKxbFt9uhsj2MyPWKo/cNKnZ
	VCB/X9OnSCiV0kcnt+MGYx2m/vM6u6x42MQKnITNGb0TgoqwHZG+a/qbP8bk7lCyTdjlyMdOdEc
	ktTavNrP+zly/Q2Bwz/NzTCpmcKhuU8OQUW0iRhYKWIVWdJCh7si1jtDgzkijJiY9D3Cbf2DoxQ
	90faGcF7qnHhMJsVbOccdBBVSaFiNzZ+Kx/IRS07PJSNVnk=
X-Received: by 2002:a05:6402:cc4e:b0:6b9:278a:99e7 with SMTP id 4fb4d7f45d1cf-6ba37d62527mr9133559a12.7.1795543163573;
        Tue, 24 Nov 2026 09:59:23 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba3711ad52sm7205762a12.35.2026.11.24.09.59.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 09:59:22 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	David Keogh <dkeogh@amazon.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	David Woodhouse <dwmw2@infradead.org>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Nimrod Oren <noren@nvidia.com>,
	Alasdair McWilliam <alasdair@mcwilliam.dev>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Breno Leitao <leitao@debian.org>,
	=?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
	Danielle Ratson <danieller@nvidia.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-team@cloudflare.com,
	nh-open-source@amazon.com,
	Stephen Hemminger <stephen@networkplumber.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"Remy D. Farley" <one-d-wide@protonmail.com>,
	Amery Hung <ameryhung@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Andy Roulin <aroulin@nvidia.com>,
	Anil Kaushik <anilkaushikwireless@gmail.com>,
	Demos Ra <demosthenes.ra@gmail.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Joe Damato <joe@dama.to>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Li RongQing <lirongqing@baidu.com>,
	Louis Scalbert <louis.scalbert@6wind.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Martin Karsten <mkarsten@uwaterloo.ca>,
	Matt Bobrowski <mattbobrowski@google.com>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Song Liu <song@kernel.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Wang Zhan <wang.zhan@smartx.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	Zhou Qiuyue <n0ps1edzz@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jeff Layton <jlayton@kernel.org>,
	Tianyi Gao <tianyi.gao@linux.dev>,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next v3 08/11] selftests/bpf: Test the tx_extra_headroom decl tag
Date: Tue, 24 Nov 2026 17:58:21 +0000
Message-ID: <20261124175824.60470-9-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124175824.60470-1-tianyi@cloudflare.com>
References: <20261124175824.60470-1-tianyi@cloudflare.com>
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

Check that the verifier accepts a "tx_extra_headroom:" tag of
NETDEV_TX_EXTRA_HEADROOM_MAX (512 bytes), and rejects a tag above it, a
tag with a plus sign and two tags on the same program.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
v2:
- New patch.
---
 .../selftests/bpf/prog_tests/verifier.c       |  2 +
 .../bpf/progs/verifier_tx_extra_headroom.c    | 40 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/progs/verifier_tx_extra_headroom.c

diff --git a/tools/testing/selftests/bpf/prog_tests/verifier.c b/tools/testing/selftests/bpf/prog_tests/verifier.c
index 6a494c381266..e3ef97ed092a 100644
--- a/tools/testing/selftests/bpf/prog_tests/verifier.c
+++ b/tools/testing/selftests/bpf/prog_tests/verifier.c
@@ -126,6 +126,7 @@
 #include "verifier_subreg.skel.h"
 #include "verifier_tailcall.skel.h"
 #include "verifier_tailcall_jit.skel.h"
+#include "verifier_tx_extra_headroom.skel.h"
 #include "verifier_typedef.skel.h"
 #include "verifier_uninit.skel.h"
 #include "verifier_unpriv.skel.h"
@@ -316,6 +317,7 @@ void test_verifier_subprog_topo(void)        { RUN(verifier_subprog_topo); }
 void test_verifier_subreg(void)               { RUN(verifier_subreg); }
 void test_verifier_tailcall(void)             { RUN(verifier_tailcall); }
 void test_verifier_tailcall_jit(void)         { RUN(verifier_tailcall_jit); }
+void test_verifier_tx_extra_headroom(void)    { RUN(verifier_tx_extra_headroom); }
 void test_verifier_typedef(void)              { RUN(verifier_typedef); }
 void test_verifier_uninit(void)               { RUN(verifier_uninit); }
 void test_verifier_unpriv(void)               { RUN(verifier_unpriv); }
diff --git a/tools/testing/selftests/bpf/progs/verifier_tx_extra_headroom.c b/tools/testing/selftests/bpf/progs/verifier_tx_extra_headroom.c
new file mode 100644
index 000000000000..f15963e34434
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/verifier_tx_extra_headroom.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bpf.h>
+#include <bpf/bpf_helpers.h>
+#include "bpf_misc.h"
+
+SEC("tc")
+__attribute__((btf_decl_tag("tx_extra_headroom:512")))
+__success
+int tag_max(struct __sk_buff *skb)
+{
+	return 0;
+}
+
+SEC("tc")
+__attribute__((btf_decl_tag("tx_extra_headroom:513")))
+__failure __msg("invalid tx_extra_headroom tag '513'")
+int tag_above_max(struct __sk_buff *skb)
+{
+	return 0;
+}
+
+SEC("tc")
+__attribute__((btf_decl_tag("tx_extra_headroom:+20")))
+__failure __msg("invalid tx_extra_headroom tag '+20'")
+int tag_plus_sign(struct __sk_buff *skb)
+{
+	return 0;
+}
+
+SEC("tc")
+__attribute__((btf_decl_tag("tx_extra_headroom:20")))
+__attribute__((btf_decl_tag("tx_extra_headroom:30")))
+__failure __msg("multiple tx_extra_headroom tags for main subprog")
+int tag_twice(struct __sk_buff *skb)
+{
+	return 0;
+}
+
+char _license[] SEC("license") = "GPL";
-- 
2.56.0

