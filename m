Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795052344;
	b=ycltj8xbswQVyYu5wlI5aiD1nghsucDNJYeVkfv2nv6cKRx4z4Q/aq6eit0P7ittAT5F
	 ouIdi2zJYFRJ+2vRCqnU9xDkRC87qXaY9ERaY+guZE/h3It60YYgjQrB++t/m4hyInAQ5
	 Ht0t+mFW/DhD2UnfmJJArG0oQigWzQVrK405bYu370KpqwCfQ7Doof1eD0Pmmg4hIyTWz
	 qkbIvXdKsDjf8lIpqLDNntRXicC3DT3EJ5Xp69xrAOX3y6QAsVrfN9WyaT7w2F54+6nUg
	 DQzl2MhY2Bl/NyEFMikiOyht9Xfcc2OLkferRkte77WXWFQEoTnowNLvatfKYFKrXKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795052344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pcVobQ6pdsPePLIZ/BBz4G2XF5J7pWqm1D1h7L58vTo=;
	b=HzyMxBHK6QjYMhnlhQ34OF5Sl62xfQ5wFCKiOMvMSvXrHVjUPI3qRDsUviKptsz5Yfqb
	 vGFdYkVCJ2awqSvP2KeA6hlMZE/zBVVU6HE9HoHCd3/gxIXaZ8gdSIWsW7zglUxAEuarr
	 /4R9GMP6cQbtlqK28cRfReLj++r328y60p/U6z0Cu8wT9t2oPIVgKszFb1e312wj9ASh0
	 FKpCiD9kVHVAMPW6ffE1/8MIeKFyxHjsnzMIqo4Le/8XGjBYwpwHdu7wi24pphPUtrUnZ
	 74iMwBWyC4z/9Au3amTLMoZjLWB+Hlci6zngdH3VLq46llO51ibMt4Jd/02qcRSfGwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=ccSGHZ15;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B7E60A260F
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 01:39:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32B7E60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=ccSGHZ15
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b8815693e2so2239566a12.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 17:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795052342; x=1795657142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pcVobQ6pdsPePLIZ/BBz4G2XF5J7pWqm1D1h7L58vTo=;
        b=ccSGHZ15/ZgOGR8IqTTC2ci5ZtHFCkvm0Hb6fQPjcMVpqXZytSMhaRxMCXyDwadjFV
         2jvR1V85z/h1YsbpP6YFAkjK35UK/YxOftElkKDqZGYiej+iMWyzMQsVA8E1ZV6brlVm
         eFaYZw5goZY9eLDohkYPL8vF634Dcg0Nihxb+K5efYasQAG3XwQ913eeVc+5RDTmlu/N
         ezYcELPFqJdtJn5iOTO/ynQgZExOJsFf6vAHL1aYjc58/rPgdNqo6sMDa3cw5O+/mUmI
         eV2FzCIHLaqATmnRR2dsCoNF/Owj95KUfwvEECcVWDSr4aQO5MHCRwC4ZN1qkLjKVD7w
         SUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795052342; x=1795657142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pcVobQ6pdsPePLIZ/BBz4G2XF5J7pWqm1D1h7L58vTo=;
        b=v824BBupPdhT0fs5FV6an52u29IzwnV3eH64g1pPLaOBORG2I9h4ZD4fs+9da/qakj
         CSmnMdrCNPYYhTLxMci5GKVCXZqNSd/2n69WzrKcAV4PDeg/HlC7ykpfN4zdi86pK0su
         pZ9zdIQV9SOnZZhCQJSYdqdkcGTWV4rT0T2AM2/cUaAqPNpYkCztJuLHGacgRHbgNW9s
         8m0eJ3itXFyI7aPOIhvudz6C0u8Glk4OFQnX5+1KpBpnOHDKF6Ls70JPSTi9cIA7nF3D
         Vv4gh8rigSXEYqeGKBNnAA+RtgTN9xMfmUK0I4Zf4WYxF5aBceXTseD65eBwxuTEySJl
         Prmg==
X-Forwarded-Encrypted: i=1; AL+hErF8LY2PhlC6lg8DjtrVzIwsoektvtEPiOFWYZOzhCgPDpbEHviNwMiZTzjFiefTWQMwmHhwI5E8luE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ijau+1kZKP67dmF9XvyaIbKZsLf0h1GObMaBFjrUyxEaiAOJc
	c35Et9IEpUuW0NX9/OH2iKLy7yhfeKCCEth8++a4hOFkpHfzIdktOTEYEsNLOmQMGbs=
X-Gm-Gg: AYBFou0si+7shXTJosA79u3TU3NVCVjomkf1UCV7G/a2TU3GZ1M1VA2M4T001rJOv8Q
	bOI/I29FwdzdN1X2hMZemJrbw63ncDjcYnkrSawZq/tzehcxtIcTQ+UOBh+uCIhhBsozxzxVWet
	fhAgR/968zkJSC/0uj8S9+eqkQhhQLdjjFFHnITXBRJcXKN+dhIdO8Jvz6nxJABgrW602p28KRO
	ozgUwCaMCvMUphf1JTOACb3rdW2KKCzgLaM/h5yc+Et46JTvPEXmquA/UnGVgNSHfxkltkCzqPV
	BDvBwoFdu7MH8qR6jLf+gzRxHRyFHaAaVYJ9CH4iB4nwQG6qpx91pd9wXOsnwzLMN9DGiBNQ/mV
	WIxXQw91syqDylHLcoCl4pVxxKzcIdAaW+Vl5wBWJ62SrhqhHzl2CPObZ4YJibKWjb9P/FPiS5p
	kAeedEL2Lh7wyIvUhgfi54EYPfqY59NB+ExCuidahDok0WMQwj4qhWJlzdbFd1R2hVqVrT4tVlo
	Pd7NTbczfw37ArIc2F7s9GCQ2wPu0+QzluKkdBS58+HsfS8/LkXDVHS5V7+/YNutjxVWqPHEQ9a
	zudFIE2MuaGjHkFiEgQASGTXd/bbmQJjSYOemjvT3ODs3L5BcwH26qYXNC/S411BO6M6LbK+puQ
	RiHQ=
X-Received: by 2002:a17:907:a089:b0:c4d:31ad:9dd5 with SMTP id a640c23a62f3a-c510e3b3e30mr395519766b.42.1795052342557;
        Wed, 18 Nov 2026 17:39:02 -0800 (PST)
Received: from L9JK9NPFH9 ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51233c4080sm59785966b.16.2026.11.18.17.39.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 17:39:02 -0800 (PST)
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
	Tianyi Gao <tianyi.gao@linux.dev>,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next v2 08/11] selftests/bpf: Test the tx_extra_headroom decl tag
Date: Thu, 19 Nov 2026 01:38:27 +0000
Message-ID: <20261119013830.36935-9-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119013830.36935-1-tianyi@cloudflare.com>
References: <20261119013830.36935-1-tianyi@cloudflare.com>
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

