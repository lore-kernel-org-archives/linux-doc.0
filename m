Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7719F36BCFC
	for <linux-doc@vger.kernel.org>; Wed,  3 Dec 2025 16:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764779503; cv=none; b=XMZjELFJIqX2zXMD6Psok0i/JcYy8Uy95GZEXQulZIembla/sK2Vywxga++Heor4Jhp7NSIRHeWgv5k2uQ8yp94rK9elxZI9LpJzwORC241sXcQzhljB3syZiuj00/DhIA41hMv+2wWRWWXDJgr7C7yuxy1Jgds1Kj7gOpRVNLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764779503; c=relaxed/simple;
	bh=l0gnY/UzSbFUAuDU1KntIMiLjASuWWo0nEVW8bui9Tk=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=r+T3JtKz4JPZkvupMPQsP4Gpwzl81JZdEUb/HtiT/0sFTTe+FvnVvTGRsTzYlVsn6byv6VQR93gUKTIHuqBnOVFML1V2pA/aw0rlPgUe3mMnqBXZB+ju19CxYdQ8Qc8963OHDerajBi5kLds4lQTKhUSBPS6oSIVtpG5luDdrbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=kTxOzvQF; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="kTxOzvQF"
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D0A5B40402
	for <linux-doc@vger.kernel.org>; Wed,  3 Dec 2025 16:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1764779484;
	bh=l0gnY/UzSbFUAuDU1KntIMiLjASuWWo0nEVW8bui9Tk=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type;
	b=kTxOzvQFwwFYahBIdvD+Q0qvBMRKooVbSEzIrDSyXsjQkiDbMfEgzbj+Rxi7qzl++
	 xF/Wwgk9KQee0ysVwVocI/GSM3WUsz49OKtsfE/lrt57IvQDjgLBNvnTGnpsYBEbIp
	 wOw3Hz3YdRNrLvNTnsrZv4SfeX7Iv845zLaRTRy9M32rN/AwmX63DwJVz3U/x/mH8Q
	 u32+jM7yWmESVEAErzupgYKp9rBPWKT021itDBARXMGaJvCHrNZfU2aTpRumLDYvCs
	 m1qEvW9eBCiECNJq6YiqjMmwqjPZt4qsjVpn7NVDopCvOkV0t0FwT2kQtzJzsAVtRX
	 Q5Fq6os9nM39CxdXxXL5W1QwrPwzn5CAp6d383j6ZJvNrhcuceCnTvh4LJmErcOnh1
	 6EGU7X6zBpYgPv9qkK0TaoeJCcnDnvXdrvF1XEacCVv0l+YmU4srBUDFvWYUghfd3J
	 Ukl71JUqpPq2aCcun0ujg9IGf9MHd0U0SDMARUs3gBBn4df87hSnd35X3D+7gq7VHf
	 Kp4ITOUFahfiCNSOTHivj/9twGRY9VYNv48hAKI7hely2r/Ql7TrjFn8mq1ADko22q
	 D1D4M7p5BNDOIspBJzOIhN1bGkrKfui59V8YZ8rv3feVbzdqVQf6nx0jzVwMiy4ouo
	 PPkiOJm+7TGV62FmfkacNBWI=
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-477939321e6so39954315e9.0
        for <linux-doc@vger.kernel.org>; Wed, 03 Dec 2025 08:31:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764779477; x=1765384277;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l0gnY/UzSbFUAuDU1KntIMiLjASuWWo0nEVW8bui9Tk=;
        b=se/Bc/QQH0tmV1M5lTx1XIFhEUP9uzysONJx89wKQTkymOLjzXgctXt8PEs/nP7VeF
         3UTPDxcygREJTFhxcVIhKJTvzHy559c0hUtNOqAr70PnrumyPnLTYHiLgUyuQTkJlUTh
         oLr2dQd7XSMO8ajyfjHVjMfRAT6gTxxUgAa1wb3hzMs9Um98t2FuIO8JyChYJZOZebNa
         d6KJrtOEnRgKfUIloG0yCe9pM/FlFdIhexknPXI+9J3odmNsayGNKflKAyHxTxUMbvkn
         QThWIARTSB2faLQ6SgI7WCitpcFf6QS9102H+4Ek9ZIesaUHoRTZat5Gq/ji0zaNle+1
         zXcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXT7C0DQC71vBupLYk/So6EQO95AnWstmtphCOJjLLyaf5xQ9qJLBxZW0LGWqZZv3kOU8BRccMlxbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAIi+yjAfP4S17qjH+H0eGsgk/WsA0nGhBhP6WpxMmWr5WytPs
	BrrFdH8li2FpugjBhq3TXXhyQuqHP0ung+J3tzQLPr171yWF/7NK0jvI6MvzZqLI54TVwTUdfmO
	rqGYoCyoGOil3E8bx28OSXuvGUM7RtOjUynXhEGrP5/p1IbeFCxzNbiMnqalZ3iZ0pOweACaDG8
	DabA==
X-Gm-Gg: ASbGncuA/ZLNLO6W5bz3pbdnTPHm7aajpaFmDHQQHXVeElmKhEI4wsOf3Kuc1RqHxhm
	jFJ6e7jz8VHxtzdLPdhI6fi3CWH+m5g0KQepoxsYnqI85zbUzDlBajQySwb0JRyEsBbnxn7OGTy
	3+7eTW/7JcwN0CgkrbF3QRbeUoCGG1M4PF8qKb5XUXtrkquvhlm8mrYyQNEyWFl+I3DyZ337vT9
	vrrU5LWbzY1L6WqJH1OmhvFU2+VO/tXtMCf/0EeV4muB+SBrrLRW/jDsxgx6LImFqwnK+aw5ihc
	0o4Dtbcx4Zjsibnwi2R5Idgupl0zFeP9dXG4uT8gQNwpJa2RvPg8cay6JpDjOtgulgnnXrc6Dn7
	yGxCbxcmHJjqjqSCBda+AQwwm9WdWUPg2/aQ25LAeEbrPTm1UIzwY53t6NDhVrxNh+wOor5VLLh
	4=
X-Received: by 2002:a05:600c:a41:b0:46e:74cc:42b8 with SMTP id 5b1f17b1804b1-4792af327dfmr27911655e9.17.1764779476157;
        Wed, 03 Dec 2025 08:31:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCKejq/2U+1EN5UAB8CezRHOHJDvwMZzcFVGMZ1T1ZB5XD8pg1afh59Y/Z4iwxgxyD87hFlQ==
X-Received: by 2002:a05:600c:a41:b0:46e:74cc:42b8 with SMTP id 5b1f17b1804b1-4792af327dfmr27910815e9.17.1764779475621;
        Wed, 03 Dec 2025 08:31:15 -0800 (PST)
Received: from [10.1.1.222] (atoulon-257-1-167-49.w83-113.abo.wanadoo.fr. [83.113.30.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c30c4sm40900310f8f.9.2025.12.03.08.31.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 08:31:15 -0800 (PST)
Message-ID: <6b25515b-c364-47f1-bd75-8b7dc16e3701@canonical.com>
Date: Wed, 3 Dec 2025 17:31:13 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: devnull+debug.rivosinc.com@kernel.org
Cc: Liam.Howlett@oracle.com, a.hindborg@kernel.org,
 akpm@linux-foundation.org, alex.gaynor@gmail.com, alexghiti@rivosinc.com,
 aliceryhl@google.com, alistair.francis@wdc.com, andybnac@gmail.com,
 aou@eecs.berkeley.edu, arnd@arndb.de, atishp@rivosinc.com,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, bp@alien8.de,
 brauner@kernel.org, broonie@kernel.org, charlie@rivosinc.com,
 cleger@rivosinc.com, cmirabil@redhat.com, conor+dt@kernel.org,
 conor@kernel.org, corbet@lwn.net, dave.hansen@linux.intel.com,
 david@redhat.com, debug@rivosinc.com, devicetree@vger.kernel.org,
 ebiederm@xmission.com, evan@rivosinc.com, gary@garyguo.net, hpa@zytor.com,
 jannh@google.com, jim.shu@sifive.com, kees@kernel.org,
 kito.cheng@sifive.com, krzk+dt@kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, lossin@kernel.org, mingo@redhat.com,
 ojeda@kernel.org, oleg@redhat.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, peterz@infradead.org,
 richard.henderson@linaro.org, rick.p.edgecombe@intel.com, robh@kernel.org,
 rust-for-linux@vger.kernel.org, samitolvanen@google.com, shuah@kernel.org,
 tglx@linutronix.de, tmgross@umich.edu, vbabka@suse.cz, x86@kernel.org,
 zong.li@sifive.com
References: <20251112-v5_user_cfi_series-v23-0-b55691eacf4f@rivosinc.com>
Subject: Re: [PATCH v23 00/28] riscv control-flow integrity for usermode
Content-Language: en-US
From: Valentin Haudiquet <valentin.haudiquet@canonical.com>
In-Reply-To: <20251112-v5_user_cfi_series-v23-0-b55691eacf4f@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>

