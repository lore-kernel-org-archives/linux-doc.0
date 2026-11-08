Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794105628;
	b=E8iI6jPMzPX9O03u99yGJSW3ZhpZqpc+YUlzAMC9YC656WRQBGE3Dt/pZtOMYRhNMxoC
	 gCpaEIqOrsmEtj68Q7qN4MCTwiFndSc5lfsvTnarJ06Gj3o8b4rAdvUPLjNelVHeE1JhC
	 ElIxq4MQpwbYEqZ6pSkEtyTZCqHqHbG/Ih6f3/ttpytN7KJ9QP2M+CMdaYn81FEHr2074
	 2hevBE4Ns4/ZCzrmLeNdZ+tRLj9Cqngu2Aej5RCGVCOCrkQTbFJXpQDlDVXe2GH7JtrWg
	 hIQgaZTusNBdmJaT5eOnQpryfhvLhsNcfG+ClP45zLPFKa9M4t/wVWfNzEL+1fBeoCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794105628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oKWYlAcY6So6bitWGtla4+mL7IVkoD8l6fm1ubuoUDc=;
	b=OZFih1Oqi/68bDGSm9imWckcvZo9JXJ2HiTlr9Pbf5PgJWyGru/aDW+s+tyYE58ijAg/
	 QT5pzAt6Fd5CGdcZJBg+vslVeoT0gVv+03Q6CsiaBetJhbObDNSOWVvNjnEw5jb5GBkq1
	 LS72xSgS1Qt3QAPoEV7vegnX904PpLwDLPVUPlREYCRD8fKK7CHFmI5eAeDNLjAXUOfAG
	 qun3pp0cN4WIbrY/se0LRuMRwBxwPQCTRFmYBwpNFdohSAkK1cbDDVF4zC5L1Qdy0A7mt
	 k/pudam3QOvwpZ4gMC7iN/Jg5bOhRLVcbp2T7DJVdmcK+7oP2lSyy2dv2mfMM4LfyiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="UXwIo/X0";
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BE9606A31A
	for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2026 02:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87BE9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UXwIo/X0
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-14394530ec6so130678c88.1
        for <linux-doc@vger.kernel.org>; Sat, 07 Nov 2026 18:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794105627; x=1794710427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKWYlAcY6So6bitWGtla4+mL7IVkoD8l6fm1ubuoUDc=;
        b=UXwIo/X0nMEY8pSegQDtBBDEYOgg9buMlNfVpUCJaCPxyDBW4GKuSMiS2XCK+ywzep
         YLB+FEBPjeG0bpzVlVZjMHkwFPnHmvbNMfI/9AKQC7cDXrmyc22Dm2q1c0QBbHcovDJM
         c6TJ73vjHeeun2Op2KyYulh+TNEFpB58UO+7biqirYqdHGmbO+KDXbpOr9SiWBjvW2lZ
         +hfZ7CgxvpS1YkJIRXIz13FGfANie7uYVWLJWTpLaIV75vKq8eNHpF07P+Hr/z1w/H+W
         preiWv4kx455lOfOGj0+SIf+7MGQBF3kBa6Lb1UgmN7odrLkuXd+JN8FOYBXmF8RPEjI
         tYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794105627; x=1794710427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKWYlAcY6So6bitWGtla4+mL7IVkoD8l6fm1ubuoUDc=;
        b=Vx16aKhw9hLiKLnuF0QXuRzdlxLyOggKXpn33RhpMvMkzfduvv7XQN2e49sZDUEJ0B
         tFGrooUHsQJ3VPhTqk9QNPRM5RyrOz8feqZsbmM+DJLFn45mvC2sblzLBwAzSrEFSLrZ
         HLQYC/7eDRkP6as6YygiHGq4uT8Yp47y+TZR6o1+UHE02HgRbIVeH90iZHTu3Ugvf8sr
         0MUvOFtz8Vs0rRLCqb9tK5iTUbOvWR2xecchHp1grvvCxWIpx/w7BEv1zaSf68IpSbsC
         eI+2Ss5vF8aHoualqFdawAin/BVBTgnJgeYJgP/BBnKKA2hzKtKlN3720r9tL4LfhNc6
         R5hg==
X-Forwarded-Encrypted: i=1; AKwUvBwka2Q4x0EIEBW7RaZBH6ntvd9CkFg/d0mGHa+D6pfszP2I6P78M7aZfy2OwxZ9otqRx2k2/o/ozNQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jJrLsp3ZGf9jZpqSe7UubVbj4zpwrfA7LNtu9CaHzVRqdyDVn
	4MyMBVw0hvAUTa9zzGtHX8JSgZwJoS1FDXkCBohiBeWZIUmWJzYI0DCs+3imSi3a
X-Gm-Gg: AYBFou0RQnZwe87JL+mQoBsX36pB4grWZg8Ktc3b5+Qlb8bHNj2cfIBjOL8Uctn5+ns
	+Wu+wb1Ae8J3133mxDepJ/vd1SKlRwkGj4LzgFeob8f24wNY5JGO5RHV6H5YxfeErY4VrKkTVah
	NnrfHNlVe6Ld62LMNlRKFB5u8h+SdD9Kgka0ZXEasmHAp5zYtEtx5hGiyrf7LkmSzNKvGSai+mN
	ZB0AKhDr5csUdePkxjpK9USkrev7G9+iz4yAwstG3lEFJog78ZX4PuaQ5KqMHAXaxYuMCwOoZ8A
	7v6h9e446cfYhprmh+8O/yyN4KRdfYzAJrmyH4fFu9xTSmpgREPE9+OrbWdtZUVw2nMQeeAMInt
	BGKwH3yv+t/Ko6J1FBNam6lwcmuka5aRy8HZdoRM2++bNt6CVTbx5lh0ybXYU/8KRVu2Slz1qEK
	OdS8cMfI2evaeTzphxNmGg4r4RbKBK+f0SZRku1DzJ/sulAgMeC7ZjWV3O27Omr3dmLFrTRZzk/
	uS/3CfywIKHB7TJGOpWu7UBTfKgzBkhVAl/9sfWM6t2dbaHdYsO0z+V+bRZNIgBr009CUbJueqM
	O6DU5KH1W9Wqw/JP0UUy
X-Received: by 2002:a05:7022:29b:b0:182:6c6c:d876 with SMTP id a92af1059eb24-1b39fec1c25mr452900c88.8.1794105627500;
        Sat, 07 Nov 2026 18:40:27 -0800 (PST)
Received: from ubuntu.. ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771e5728sm2228842c88.16.2026.11.07.18.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 18:40:26 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Xu Xin <xu.xin@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Stefan Roesch <shr@devkernel.io>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/4] mm/ksm: align smart scan skips with the scan number
Date: Sat,  7 Nov 2026 21:40:19 -0500
Message-ID: <20261108024019.1195186-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <7df793d7-55dd-40db-8455-1f22bb44193c@kernel.org>
References: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-0-16d5ce8b5fd6@gmail.com> <20261107-bug-mm-ksm-smart-scan-align-skips-v3-1-16d5ce8b5fd6@gmail.com> <7df793d7-55dd-40db-8455-1f22bb44193c@kernel.org>
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

On 11/7/26 20:51, David Hildenbrand (Arm) wrote:
> On 11/7/26 17:57, Qiliang Yuan wrote:
>>                               before     after      after/before
>>   pairs merged (of 420)       361        420        116%
>>                               334        420        126%
>>   pages looked at per scan    1792       2048       114%
>>
> 
> Oh, I was wondering whether this should actually go to stable? Do you think the
> above is rather an extreme case, and most users won't really run into it that
> severely?

I don't think it is an extreme case, and the test above rather
understates it: it makes the second page of a pair mergeable while the
first one is still young. The age of an rmap_item only grows, and is not
reset when the page content changes, so on a long running system most
unmerged pages are past age 8 and each is looked at every ninth scan, on
a phase of its own.

To check that case, I let 1800 pairs of unique pages age for 32 scans,
with the second page of each pair made mergeable 1 to 9 scans after the
first, and then gave both pages of each pair the same new content:

  kernel           pairs merged after 16 / 32 / 256 scans
  before the fix    112 /  200 /  200
  with the fix     1666 / 1800 / 1800

Before the fix only the pairs whose phases match, one in nine, get
merged, and the others stay unmerged. Three more runs of 64 scans and
one with 128 scans of aging gave 200 and 1800 each time.

It is limited to content that is not in the stable tree yet, since KSM
pages are never skipped and later copies merge with them, and the cost
is memory that stays unmerged. With smart scan on by default since v6.7
and the fix being small, I'd lean towards stable.

I'll send a v4 in the next day or two, which also makes the new selftest
helpers treat a short read or write of smart_scan as an error, and can
add Cc: stable to patch 1 there if you agree.

-- 
Thanks,
Qiliang
