Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7062F3BB9ED
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 05:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791437879; cv=none; b=KwUxWMLXHW9FTYUQSEdVNeRDEGvYyJ+G70XXEPpVF9aTvFP0w0w356hWjJf0RctWuCCXeqSAT35HzlYL1R9yWo/LtGiXxrswYC4NgI+Kpa5ttARTST34AUMdT4lj7HH0hsFjhM4n6OFQXiZaAnzqv1jNpgoQ48fuChpRObLBbwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791437879; c=relaxed/simple;
	bh=1Es+O5gUAfmFViPOKvPNBGlel3oVhwqYtDml3CwM+Lo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cTckxvMCSl8myV4bHx8SsDy16/iyyGMq9YukVMe4gFel8diXmGN7/B/Z9a4hZ5plKXGw2rR05ElqBveAgG53wARs9DdbRsFyQcqi0P7V+vNy8yqD/Shf6sk5w8IuipngyRK8/qTYkNCuMBYthrn7WVWIia+BmawwQ0xyrLgBFOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TWbGwVaF; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TWbGwVaF"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b0584ad71so1746478f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 07 Oct 2026 22:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791437877; x=1792042677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RrJHqVEE809VPtPoK85AUD6Bvdktoej0RW32RmBaNCM=;
        b=TWbGwVaFPJSrj/a/pKFkolXf/0mYoD4TfrinJZtcCDo1skxffrv3CMqUKVNnM+NQbi
         Wlcg05fNEcTa6GbvgSWq99EOJYmaVd7zNqMmnjoa2sB8W8iLcYTD+xRmgxBfY74PzrLp
         uM29jDsjwQKfTLRv019mIDURn7nSCKTbCKCuhN6mtjvv8GJOc1LJ3AUOS6kwOMDku33T
         mPAIOOsCLcxLHmOhzvTxsQatrb2bmL70JYQMgMpV7JcWdA1tciLkTM5TXwa7t+4thPBL
         l5xe9YhSZ7uf0IGkZT7vardjLeHYO4CLuvk1E/WnvTEF8dIzrQu3at7HFz98Z+aleSBg
         z44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791437877; x=1792042677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RrJHqVEE809VPtPoK85AUD6Bvdktoej0RW32RmBaNCM=;
        b=spsX4Ntp3KMxkASLmcaYqdDNZljUh1U9jv4WhOnr/b8QbMoIdlf8ENlFgvockdK04f
         qgrY0FTFoUkqyMPIAPOU4NR0uGg2OYxNHB8MSWPCCE8VUjoOaA2KhVSAoUPbfqlnA6nS
         gK4gPR7FKWN+hqGA5rmyCsgN4yrWIjX22N2+WjG/6/C4oXQX7E5zR+H+3hG8ZHg9Kvyq
         ejcTK6gfuXac6s/AqpxytNMpHYJWZq7Qp32Iy0u03HApZrXi7fTHn50M70+AeqM/lO2e
         TxLThiXxyPcxR7s3V/CBuzhKRdWdgma7rADFCisfgE0QJ1rgmpE63SgHysAJWp5mZGNH
         EaOQ==
X-Forwarded-Encrypted: i=1; AKwUvByiJgjO/JeQ7IM5MRjwpkCYg/H+REsrXK8H2iRSayFuKu+dLUJAF15M06AVSgV715vDZiZg2soLPcM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbKZTbeRt9/MJyo/WolntRWFUsrBNDWwcSzTow66ehDi1L4XDA
	u95+AXzZhKDlAeySOf2Ui5Tul3RQkX1jsi9LsESdB3HIOPTbwtQVo+Np
X-Gm-Gg: AYBFou1vHC2lHM6W2lYjuUeEoiMfpvOVOWvNOXkrMg4AdD9bqv7Wi1i4ptbiKRdLAxU
	dq6AQFxz2H6sup1zM+3KFomo2pB81vlXpe4sKQehJjv0+D2phv1YxjfU++U9lrNZFZh9ApQhR3c
	3EfP4NzkdKV8Ox/11z6TXL5nW+81VP5Vh5uYjCP5TwTJntsc2U8amASiHm4W654L2aniH+PrI6T
	ljvzjG3sDfbTzmJw/d+gDTQlG4mvDQzouXd+vj/Ws/LOLgTD9Mp9Pw33LnetQzqpYhSA7PybGmE
	1+oDyMug+l1lF5diIKFh6tSD6DtElSYV41Fz7kfLaflbbWUrvBCzYiXlxVr1ZOs7qwWJmFc7xBE
	xExoxOvo1OKeCz1XMEazRe/FihisrRaJ2YZ295aAsZB98j3dX/0LlQCeg0bp00N8O7zCT3X8IQ0
	0WjRmHIIdRvRVseyOuhjaNIMWDzhCeXxJ30VISlLyvSoNjdJsL2huX+0VkRR1ny4XWbWKAqSaVo
	r0FzCKmSPv/TnSiM/hrpIFxoLicEvEG95NVsMskMLLFr1THdmRkglXc7eVuuVFJPz9LXlImxO2o
	z8nL23vBr04dAg+YfRYsCtJDDtlsxGJWoyjLOfZNtqLhLPgj8K+0diHrI6G8riwDfpKJ59cvNJ+
	RCchegCo=
X-Received: by 2002:a05:6000:2281:b0:488:89c7:31aa with SMTP id ffacd0b85a97d-48c728852dfmr8353187f8f.39.1791437876591;
        Wed, 07 Oct 2026 22:37:56 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f8fbsm8458219f8f.33.2026.10.07.22.37.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 22:37:55 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] ARM: cmpxchg: always inline __arch_xchg() and __cmpxchg()
Date: Thu,  8 Oct 2026 07:37:41 +0200
Message-Id: <20261008053746.49631-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261008053746.49631-1-kmehltretter@gmail.com>
References: <20261008053746.49631-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__arch_xchg(), __cmpxchg() and __cmpxchg_local() end in a default case
that calls an undefined function. That turns an unsupported size into a
link error. It relies on the functions being inlined, so that the
compiler can drop the default case for a constant size.

They are only marked inline. gcc 8.1.0 with CC_OPTIMIZE_FOR_SIZE does
not inline them in rust/helpers/helpers.c, which calls xchg() and
cmpxchg() from many small helpers. The out-of-line copies keep the
default case and the link fails.

  helpers.c:(.text+0x424): undefined reference to `__bad_xchg'
  helpers.c:(.text+0x4ac): undefined reference to `__bad_cmpxchg'

Seen with bcm2835_defconfig and CONFIG_RUST=y on v7.3-rc1. The same
config links with CONFIG_RUST=n. It also links with gcc 15.2.0 and
with clang.

v6.19 links. Commit ab717dd98bee ("rust: helpers: Add i8/i16 atomic
xchg_acquire helpers") in v7.0 triggers __bad_xchg. Commit
ac8f06ade38a ("rust: sync: atomic: Add Atomic<*{mut,const} T> support")
in v7.1 also triggers __bad_cmpxchg.

Mark the functions __always_inline.

Fixes: ab717dd98bee ("rust: helpers: Add i8/i16 atomic xchg_acquire helpers")
Fixes: ac8f06ade38a ("rust: sync: atomic: Add Atomic<*{mut,const} T> support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/include/asm/cmpxchg.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/include/asm/cmpxchg.h b/arch/arm/include/asm/cmpxchg.h
index 9beb64d30586..0ce5225af442 100644
--- a/arch/arm/include/asm/cmpxchg.h
+++ b/arch/arm/include/asm/cmpxchg.h
@@ -26,7 +26,7 @@
 #define swp_is_buggy
 #endif
 
-static inline unsigned long
+static __always_inline unsigned long
 __arch_xchg(unsigned long x, volatile void *ptr, int size)
 {
 	extern void __bad_xchg(volatile void *, int);
@@ -155,8 +155,8 @@ extern void __bad_cmpxchg(volatile void *ptr, int size);
  * cmpxchg only support 32-bits operands on ARMv6.
  */
 
-static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
-				      unsigned long new, int size)
+static __always_inline unsigned long
+__cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size)
 {
 	unsigned long oldval, res;
 
@@ -220,9 +220,9 @@ static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
 				      sizeof(*(ptr)));			\
 })
 
-static inline unsigned long __cmpxchg_local(volatile void *ptr,
-					    unsigned long old,
-					    unsigned long new, int size)
+static __always_inline unsigned long
+__cmpxchg_local(volatile void *ptr, unsigned long old, unsigned long new,
+		int size)
 {
 	unsigned long ret;
 
-- 
2.39.5 (Apple Git-154)

