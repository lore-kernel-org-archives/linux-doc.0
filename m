Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077095;
	b=REPFtU1qQM2HKCrNETYDGLvNdFqW/tgNGGemfj9/C3GjUaE+MxqLzYwSA7LqR3B8ONdu
	 6r2bbwkwC3+tTgEWV6ZNJ57+YPOw7B24cBT2a8xp2QWijHngYetF/UnlXfbgIJx8FA5yJ
	 hZ3IR46hibxaBvYuZ6gJdpnyYTH/JPhrtbK1JqhgaTcX9mJeXecmRpcvtD5J9zVAUzRVY
	 AcndHPwPJ/nKgll6QM2Oripu1ndoHPcFKnInShtaEYljxiS44Nl+CSClI7AYNcvh3gmaG
	 62SCBnz8znnVF2k0gAnns+khKZdYzrIsJ1BmUKp9k0k7jkVqUMcCTde5oNFxnE0l+xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077095;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=vaPFVpL/9If37STR/jB8Rs5zzcu3i/Qfukaxf8Ff5Jg=;
	b=wRkE3XhaiLRsIofe8UEQI2+yhDCCQ1HHvCl87Gt7/iTweYc6D/Yw9JDIecwXn2wfjfRj
	 HsayU0mwwgM44l+Jxw5HFODJ/pF3rSHadXDbB/zMUQ2PtbU1DjpGQopDIOUCoJlv2mgBP
	 S2yc0wJQE3Dy95bpOz2O8we+EDKzjIL1rBCa7M8C5Byvuti29stnR0VJL75mpuF4Ppkdb
	 nqeiRg05B+hopnHjYKTbDKt97tg1AcWxEt25CPOTapugNB6clDbLCii3xWmk6zDyaBvJc
	 OqkhectwVega7gsm3kan8UwwXM/xdBsOJZ6KJW/3y0ygwH1PX2/kfWQ2FcyhZvOItlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GIx7CChS;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=H71ilNIZ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDB2606A324
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 08:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BDB2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GIx7CChS;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=H71ilNIZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795077093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vaPFVpL/9If37STR/jB8Rs5zzcu3i/Qfukaxf8Ff5Jg=;
	b=GIx7CChSRqmu7r4lIxiZkCphn8R/HMoGfQLPQIbCv0rn/linnVGwDAA/6jbPJu/Nmv3904
	8SShlM2233GN1JHIMnKL7XnToeexZWP7ZsdN0cTd+PNNolfh/qUTvdDPyTIRnwJwJkzBmJ
	Blc08t93zkhTr7mK9j1eg3SqnXuamF0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-25mWIGGpM0Wfdxuq-8EQSw-1; Thu, 19 Nov 2026 03:31:32 -0500
X-MC-Unique: 25mWIGGpM0Wfdxuq-8EQSw-1
X-Mimecast-MFC-AGG-ID: 25mWIGGpM0Wfdxuq-8EQSw_1795077091
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-49337a224a8so1307794f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 00:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795077091; x=1795681891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vaPFVpL/9If37STR/jB8Rs5zzcu3i/Qfukaxf8Ff5Jg=;
        b=H71ilNIZiYQSYWQFSHTAVFLdeR/zdYUxy/I6kF+095WIJaeAaVRgVXliryYM7KlTCO
         1ICPmhQ50M5KQw5cbXIT9IzsuncvdQhwon8eMBuJpZMHh5k9i3+GFEq2nkYNrPgCe670
         kFMRCbzoiahF0K5nAJKsgG+Gt70brBR18AqRf3l1JX8fbLQPnBmXcrh7Rbsw4SK6F+Is
         CO+pGiVuo7flmq9gamNZ2d4RyVtx9lv/LwHryf3c4eNh8/tqgJ1RhaqpC2Exg9l3pPSZ
         4KV4rKmRN+vqhoGP4VTW5qdLd/7wKZVvgdmcZ6+t/zppFy8ptYho+iNeiQW9kRLat5Mp
         shuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795077091; x=1795681891;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vaPFVpL/9If37STR/jB8Rs5zzcu3i/Qfukaxf8Ff5Jg=;
        b=PcxcWJVLf7REwYijTY+dkevx/8ndpRVDTh/ndDtYwg2A1EWZt6A/F9D8eOrHMCCMKA
         t2SXjSTb+zl5KVVO3DtIyzQzDZ3RP12I7dVlBBMrAwoMfOpBDZCMJE0kAMmjCQTVbYNo
         lbVklnumU3quOhjNkPMAUqrODTdApDGmxibRnexBBkT8mQZH3CO7NwTkFuRP8XR11yvz
         YNxejSq/jWY/ICtXtSYy1+CyYvxEvxk9xeYL0bgd2MPdqaf3PZKa2O6C9CGMUNEF5FTr
         Ef9I7cOiqIKhhQygCGj+X4NkgRMr3s8npR32p3GFcMWz2a8eVXKOqZgBQK0IBfY6xZ09
         6eIQ==
X-Forwarded-Encrypted: i=1; AL+hErGVHQywpvuU3Nq/IDrSekLlIYOjuhX6BxrLGquhWuAWVisEHsT6u9OZgle70I7kJEl2FgVUbIu7Njs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UEe1zi7RV4OvF9DCLsBK5bV5hdBvuIpcgIemTPzMYFc/b6cWW
	+FkVhd4PdUkX76A5UZ02KPNJs/SQyvwubW7V84RX4xQWJSD+UhOOBzLmA48Y5hrMb8B+2Chh8em
	Regew39v6Q+eYh7gUBXQYNZlCPnrkFm0mI05x5g2XndMbIGE3FePkMaeQVlzcHQ==
X-Gm-Gg: AZFdTZfsu11SxwdVzVKkz0FcFXiGuUP+gnTtbiyOtPSUeyc40bhIUUKKpEDg2iLt0KZ
	9SN62QQ8iovz3DkmchgHVPCq8wIHGbyRUnYGSkwzJvAhKPNHXrLHpGaD+pzZilMOFIJlPSZZX4n
	Is0q5QyOFGyCU2jxoOcIOL1I7hj7Ieqe81YgZY4GbUE6IitewfgCzpBa4ZkLTQjOhMqGBEyMeQx
	1zxMGoccBCNxfoI9/7ZT9HKW39RG8yfSX8yFlJB1wwis9jjqmmNI+5Dk8qKvWqKKYdqascxWHGZ
	tcHFwPjLy+KyIHfLpcvYTU/ruXsU0a/DQEFR2ec4WJe3mkL20Jzq7DpGJi5CqE38dJ6FzDgrTVG
	xlIuY5nqMggDgTuh2qUXSc4iQgKi9xpUAWGTYae3w5K4i125zrCplBd4BwigjO3jmC9eyXL7o5S
	Fqcz1SdMWXaNmzxTdmzZTMHYMZselNHPIZ+Vk554MhPmW1
X-Received: by 2002:a05:6000:430b:b0:4a7:790c:4a34 with SMTP id ffacd0b85a97d-4a7790c4b13mr8112495f8f.20.1795077090599;
        Thu, 19 Nov 2026 00:31:30 -0800 (PST)
X-Received: by 2002:a05:6000:430b:b0:4a7:790c:4a34 with SMTP id ffacd0b85a97d-4a7790c4b13mr8112361f8f.20.1795077089781;
        Thu, 19 Nov 2026 00:31:29 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm9141506f8f.18.2026.11.19.00.31.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 00:31:29 -0800 (PST)
Message-ID: <d0caebc6-07c0-4372-aaee-017cf22ef00a@redhat.com>
Date: Thu, 19 Nov 2026 09:31:25 +0100
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 11/11] selftests: net: tx_extra_headroom: test
 the veth attribute
To: Tianyi Gao <tianyi@cloudflare.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>,
 David Keogh <dkeogh@amazon.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, David Woodhouse
 <dwmw2@infradead.org>, Dragos Tatulea <dtatulea@nvidia.com>,
 Nimrod Oren <noren@nvidia.com>, Alasdair McWilliam <alasdair@mcwilliam.dev>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Magnus Karlsson <magnus.karlsson@intel.com>, David Ahern
 <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 Alexei Starovoitov <ast@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Donald Hunter <donald.hunter@gmail.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Breno Leitao <leitao@debian.org>,
 =?UTF-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>,
 Danielle Ratson <danieller@nvidia.com>, Kuniyuki Iwashima
 <kuniyu@google.com>, bpf@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-team@cloudflare.com,
 nh-open-source@amazon.com, Stephen Hemminger <stephen@networkplumber.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "Remy D. Farley" <one-d-wide@protonmail.com>,
 Amery Hung <ameryhung@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Andy Roulin <aroulin@nvidia.com>,
 Anil Kaushik <anilkaushikwireless@gmail.com>,
 Demos Ra <demosthenes.ra@gmail.com>, Eduard Zingerman <eddyz87@gmail.com>,
 Emil Tsalapatis <emil@etsalapatis.com>, Hangbin Liu <hangbin.liu@linux.dev>,
 Ihor Solodrai <ihor.solodrai@linux.dev>,
 Jiayuan Chen <jiayuan.chen@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Joe Damato <joe@dama.to>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Li RongQing <lirongqing@baidu.com>, Louis Scalbert
 <louis.scalbert@6wind.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Martin Karsten <mkarsten@uwaterloo.ca>,
 Matt Bobrowski <mattbobrowski@google.com>,
 Michael Bommarito <michael.bommarito@gmail.com>,
 Nikolay Aleksandrov <razor@blackwall.org>, Runyu Xiao
 <runyu.xiao@seu.edu.cn>, Song Liu <song@kernel.org>,
 Thorsten Leemhuis <linux@leemhuis.info>, Wang Zhan <wang.zhan@smartx.com>,
 Yonghong Song <yonghong.song@linux.dev>, Zhou Qiuyue <n0ps1edzz@gmail.com>,
 Tianyi Gao <tianyi.gao@linux.dev>
References: <20261119013830.36935-1-tianyi@cloudflare.com>
 <20261119013830.36935-12-tianyi@cloudflare.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261119013830.36935-12-tianyi@cloudflare.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 02:38, Tianyi Gao wrote:
> Create a veth pair with VETH_INFO_TX_EXTRA_HEADROOM set to 64 bytes
> through YNL and move the peer to another netns. Check that both ends
> report 64, and that tx_extra_headroom of the sending end is 64. With XDP
> on the peer it is 64 + 256, because the two values are added. Also check
> that a value above 512 is rejected.
> 
> The helpers leave the RtnlFamily socket to garbage collection, as
> link_netns.py does.
> 
> Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
Self-tests are failing:

# selftests: net: tx_extra_headroom.py
# 0.06 [+0.06] TAP version 13
# 0.06 [+0.00] 1..20
# 0.15 [+0.09] # Exception| Traceback (most recent call last):
# 0.16 [+0.00] # Exception|   File "/srv/vmksft/testing/wt-1/tools/testing/selftests/net/lib/py/ksft.py", line 440, in ksft_run
# 0.17 [+0.01] # Exception|     func(*args)
# 0.17 [+0.00] # Exception|     ~~~~^^^^^^^
# 0.17 [+0.00] # Exception|   File "/srv/vmksft/testing/wt-1/tools/testing/selftests/net/./tx_extra_headroom.py", line 195, in test_peer_xdp
# 0.18 [+0.01] # Exception|     map_id = _load_progs()
# 0.18 [+0.00] # Exception|   File "/srv/vmksft/testing/wt-1/tools/testing/selftests/net/./tx_extra_headroom.py", line 83, in _load_progs
# 0.19 [+0.01] # Exception|     bpftool(f"prog loadall {BPF_OBJ} {PIN_DIR}")
# 0.20 [+0.00] # Exception|     ~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
# 0.20 [+0.00] # Exception|   File "/srv/vmksft/testing/wt-1/tools/testing/selftests/net/lib/py/utils.py", line 259, in bpftool
# 0.21 [+0.01] # Exception|     return tool('bpftool', args, json=json, ns=ns, host=host)
# 0.22 [+0.01] # Exception|   File "/srv/vmksft/testing/wt-1/tools/testing/selftests/net/lib/py/utils.py", line 252, in tool
# 0.23 [+0.01] # Exception|     cmd_obj = cmd(cmd_str, ns=ns, host=host)
# 0.23 [+0.00] # Exception|   File "/srv/vmksft/testing/wt-1/tools/testing/selftests/net/lib/py/utils.py", line 101, in __init__
# 0.24 [+0.01] # Exception|     self.process(terminate=False, fail=fail, expect_fail=expect_fail,
# 0.25 [+0.01] # Exception|     ~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
# 0.25 [+0.01] # Exception|                  timeout=timeout)
# 0.26 [+0.00] # Exception|                  ^^^^^^^^^^^^^^^^
# 0.26 [+0.00] # Exception|   File "/srv/vmksft/testing/wt-1/tools/testing/selftests/net/lib/py/utils.py", line 134, in process
# 0.27 [+0.01] # Exception|     raise CmdExitFailure("Command failed", self)
# 0.27 [+0.00] # Exception| lib.py.utils.CmdExitFailure: Command failed
# 0.28 [+0.00] # Exception| CMD: bpftool prog loadall /srv/vmksft/testing/wt-1/tools/testing/selftests/net/tx_extra_headroom.bpf.o /sys/fs/bpf/tx_extra_headroom
# 0.29 [+0.01] # Exception|   EXIT: 255
# 0.29 [+0.00] # Exception|   STDERR: Error: failed to create dir '/sys/fs/bpf/tx_extra_headroom': No such file or directory
# 0.30 [+0.01] # Exception|

full log here:

https://netdev-ctrl.bots.linux.dev/logview.html?f=/logs/vmksft/net/results/917806/169-tx-extra-headroom-py/stdout

I'm dropping the series from PW, please wait for AI review feedback before resubmit.

/P

