Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721976;
	b=qgMJyrc33hyHWMwkCAAX4qsWk8xHeNCYGlJVy9tcdjksGNCesSCXxel20hN9vOOpk/5u
	 SxL/NBlciEjp9cVAO5praQ6S3Qn5O1RXiYpRMjymvnZ7cPWksams8di9tlcAexwT/FS4k
	 27nDdx7W7a6yc4cIJNRtX6QqiAt/0rTW9gLrXj7EtDThow/Yiculxf4vtwcBJl65vmN6N
	 /jUpTt6RWdlhMUoRsQ4NOl8xIOKs2S1AnGO2oUqxZUiZUAhyfhKOsHlw7qy6WcFld5Qc1
	 +mUREc3pY1jwWRXyurpq1F8v12lx7HkZVxtE8vck88XvtqXhrK0b3Y3MEoBbo1Vxtuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1JyQHuNi3zirNTL3+DOhmQ/6X/ugkLPIWASz+EFn6GQ=;
	b=L+idWcGehISTQBlQAfa2nemWd+XRHIfwtw5RJtOMskcPe9OFSGWaKkrNOliT6L+Mf2pX
	 z1vOKr/nFCeOt+K42MSBcUTw4hP4FLHsaxWdHOefHKWCa1+/DfQJx+2ELh8NtQ7FSYFOz
	 l706EQfodeLea0mHIAF90p5aC8U1BQpuKeGQ3WbLWkfTnisV0frX05+A7PepwYM3H20+X
	 c6Me7qERp1HRLyHJOm4Z4okM7IhBJ+6ezmN7EQCSoWqk6V9yvtS051x4TmiAS0jFWsWar
	 YeHGv5jVyIfinl0do34w+krF1OLAhHyyxrrlQyDwJ3aqxeyrHHP23RQrgjLWJ6PV5Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hXgRsW1s;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C7B606A31E
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 19:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68C7B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hXgRsW1s
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso4327526a91.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 11:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721976; x=1796326776; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1JyQHuNi3zirNTL3+DOhmQ/6X/ugkLPIWASz+EFn6GQ=;
        b=hXgRsW1sPKv9RP/Rm3tgbgYtDYEQxgSCQaaOHYzKOU6WeKrPL0tEZXdrCOOfesO4d7
         6ef3DDJcrWSSVyCl0YrGxi2zUwjfrKy+LOMGYKhs+NNVMhuDRHmfUutq8+BnCh7tW0op
         4tozsnVg+3cuWvAmlRIRUwU5nBDIQvW/TNSpFjo8ox6hq73yf/Vu0LF33FKcg1qh87fM
         gU3n0wUiysK+NH7OUb/0R4nj/xT64OZLLUsgE0/uhaFXj12lzsDa5qFgMtixmo3BEH5l
         3SfHLg8VDGAGWpxcMegXrYRb9FKAftlF9h1QiTBT8W8acFT5TA/wBfxOze7TFUn555Xj
         VoFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721976; x=1796326776;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1JyQHuNi3zirNTL3+DOhmQ/6X/ugkLPIWASz+EFn6GQ=;
        b=Paz6ejqjaONVINMe/JffSwNd+0D7YrmwOPNqwNkaojspaxIQgr5bEqbd/xWYQzqHsn
         /AxT5ak7707/X9s5M/xfU92aa9kefP1r23p7nhfMmc1Yi70llnxOfDasyk+QEwJUx1ip
         QlqQq/l436aWAbtJyg+R5vyKK+Y+BS+sS1ubKDZr6aUZX4UUucVX069Cz7oFOZtYEujc
         EsJW4HC7pOBGV+MspjQWhrmThMSoo2jpmo2niIAzFsdFLbvZaJAKhh8r6KWN28VChfFR
         YPOzEpT7OTFsY/s2Ke9eELRM8ScGQ3oq0G7MLQZV+l6D76PC9WGb5cUiBhkDYAxDo0IO
         oWLQ==
X-Forwarded-Encrypted: i=1; AL+hErGtcltF1hkkY4wGHN8NtMEYnYmZ3/0fexJ6xJMsR/DeFG2bQb3Q+o01IUleUAjNqDLqjM0oF8ZbCu4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0+M7jjFMYX/DuuPtHwwjgD124QVNV2OxI3bgQGr1QeVoOEIEj
	SwC9p9GUDG/KvPNBbxFzglWLC35PGjRCIiZbtUsuypJHmAaQu0rNyEcs
X-Gm-Gg: AZFdTZdZ1eVnpn6hBCChGQN/GxTgSj+QwXz53K+kD24OMGH/I8gtBQ41+8jF9AKgvhX
	+1Cu5sP54Yt/wLnhqYbwwLy23DAMrSXlNzw85z6snXnETVhjQTTV6WxOC1lgX84aZX3ZYTbd1VA
	okG+Zzk07drsq+MFQt5+jcD5XXGytL1Masx5q+j7/SD5t762bnKEJaMTjJsIYAhrnRDQItKS4Lc
	/rkQXNZRap6lpo+oIxHlVZWFLXpI4p0HZWL1/FcFSMuLupp6pTU4XnAAhsYJ0PzfKCsll/6eS4w
	u/Dq/wsGXIU6ryxxVqMehQObW8AN1N6Hp3l8vJiFtQ4FmJv2eD9BO/FY4H4QHPXA4KqXronEkq5
	erAnMBlXhepY+IkaXB7IA3oNcUSXeir51utyp3ZfcH79ZMuVfuF6c49da0XpXbbsTHBsz5Qa76f
	kf80C22UC9Sib8e80bn47sORp+syUMZFPLD7CxrbVJ6Ofkq2QII5DF+0dOgQtm+70pVU5Vl2CRZ
	3g8gj6KXm8hxP+Zs6rrWi9tcKa/Us89po50QBLsVblaFoVocJjnhx23zZifX1fKKCRA8vsTxhU6
	W0T7WiCPTRPWmLHHeHhIWC6tWKFbXg==
X-Received: by 2002:a17:90b:2701:b0:3b4:1bf1:9873 with SMTP id 98e67ed59e1d1-3b41c8dd1b8mr20338360a91.19.1795721975723;
        Thu, 26 Nov 2026 11:39:35 -0800 (PST)
Received: from google.com ([118.150.148.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b53479b149sm37761a91.6.2026.11.26.11.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:39:34 -0800 (PST)
Date: Fri, 27 Nov 2026 03:39:27 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: bot+bpf-ci@kernel.org
Cc: corbet@lwn.net, geert@linux-m68k.org, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com,
	memxor@gmail.com, gerg@linux-m68k.org, skhan@linuxfoundation.org,
	rdunlap@infradead.org, martin.lau@linux.dev, song@kernel.org,
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
	ihor.solodrai@linux.dev, marscheng@google.com, eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	bpf@vger.kernel.org, daniel@thingy.jp, martin.lau@kernel.org,
	mason@kernel.org
Subject: Re: [PATCH v12] m68k, bpf: Add initial BPF JIT compiler support
Message-ID: <awiK1SMNCNxNipjQ@google.com>
References: <20261126170538.3471057-1-visitorckw@gmail.com>
 <0eb06d3a00f2e4d56c2f25db16eb8b02160387281fe455b0e0e5d7466492657e@mail.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0eb06d3a00f2e4d56c2f25db16eb8b02160387281fe455b0e0e5d7466492657e@mail.kernel.org>

On Thu, Nov 26, 2026 at 05:45:05PM +0000, bot+bpf-ci@kernel.org wrote:
> > m68k, bpf: Add initial BPF JIT compiler support
> 
> TL;DR: Nits only, no bug found: the m68k JIT hardcodes the tail-call limit
> (0x7021) and the 44/48-byte prologue jump offset; suggests named constants and
> a check so later edits don't quietly break tail calls.

I'll hold off on respinning just for these nits and fold them in if a
v13 is needed.

Regards,
Kuan-Wei
