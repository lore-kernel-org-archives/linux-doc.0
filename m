Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793219826;
	b=LYPnfRVGqRLjX/0vlZxL/yaYEKPhzyDgsbQuCHMjzAXGTGV5EVdE5kVHRxlfDY1LLNCU
	 /tmzERf3LS1bm2JC+2MdrSpwwbwUqQLXMQtbiL8Gag2MNtqV/5cH8lt6uBl+QiGhuUmKl
	 B+sWdN2GRJyfM4WE64aXfFuaADsdvT/tqASr3eYbHlalN3JMomLCPv5jhMRrDgRJpn3uS
	 UirTaNOzHoRvhWMHa5jDZSjez6RdeqH8YS6HESWm6iP48+O54gFAkqgBW74XBM9pFbM6l
	 9vpo8gf9s3FIq7U+zgowpuHX2ueRAwQ2RSTEk6S0ddH0fLoJ6jGwDCjKxszlhjD1M3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793219826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=pXX75GaXTMr1qGEscquEidPOCC4V+kXbyCqTlbWwNJM=;
	b=nk1w3vUb105j0cscxtiqtiOxX7lBMAPymzkte6kY+j9IhRJyBc6+oMrKxLHH/EchcxKL
	 d71PvvYK6VI9uW/ZoMix6kKWcBIUhX7qoTr2qDRWPLAVGkERfhHAJw4H1Ba7moIQXvwz1
	 O4Wk4y29DTQLVyEFYekXwieVHhgDl1Z+3ksg6fuaPnwLcGcxb1IBRxEcsUM+ckcoaDmo0
	 b9CQQvwg45KtDhMyNCjsrcUZfJdMGgLYA2HruXyQSBGcSjspd1KvCE0wx2QJyEeFEBM5+
	 8DJt2tcDWrG19sHe2uyAsLhK0r/dA+sbTY21lLWhRFZw//ffOnhCxQWJQKaTM7MMLcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=EOo6CdTD;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515ED606A322
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 20:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 515ED606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=EOo6CdTD
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5eaf169fe3dso482517e0c.3
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 13:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793219825; x=1793824625; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pXX75GaXTMr1qGEscquEidPOCC4V+kXbyCqTlbWwNJM=;
        b=EOo6CdTDNZUpChXfxEDljEqH4BHQcYLAieNp0ah7yEn4oUXvcC24nmaVAiwb82JiBm
         MS9p7RNsQ/Yau2L+HiebwbdNeFGcSeWtjxQSQrKEXXUZLzQBLrwrBmZ7gkprByDUrwDA
         O5lORsL1LBmM5aKlh9Z1Tz9yxOe2n0MJn4bLykArrCCNf+7Ld5UgrypzciYkhPU4TMxJ
         Vfyu20n7gPm+7yUfNBQAdv/Kp20TS4URauCeEtO9122o3RK1V/Q4WQIgzMeynzleXkyO
         5MxIt/I6QkCl0ZiEf4af4nog/5Oj0dd6LE3Xo12kjcou4bZDTu5wV7UvgIFguTGqydVu
         t7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793219825; x=1793824625;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pXX75GaXTMr1qGEscquEidPOCC4V+kXbyCqTlbWwNJM=;
        b=IaNTr/9TroNfWA3OSqDpwbZpNNiViEzIsT0WD9wqN/ow9qYTbLQ7PMOPcopvK7VDnA
         Tw2QbvSVtPswwE4U7i3WjwZmHXgRB/WyN76tbZRy82+uotUlVThrM1oFNOF6P6vBRH5u
         OHesmk7YNpPRsN15KWvmTptiS0THMtv+FGnPOeiZQyxZnoxF9IW7qSpdsvG9KSBJoHii
         JLjJO2OQmsnOYtaN4nZoRZKxexjIYuz1Nv+TPNyM9cFmnTLCxTI0er2BvTTRsPXQFKFa
         mU99MOrLIbj7O7I6K4ScJZcaL1P5e7/3fn9pi3u0ditUJWObK/f7oH1ruRzArtFdagwl
         /wYg==
X-Forwarded-Encrypted: i=1; AKwUvBy5whiHv3IZsfdQd2AHKJPO2BkQhAXlloeFwA+SVZxBYZh9h8Uec1oLs7np0Q+JNSigcriX15SteHI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+P70lNAiQkoMCQ/VsbbDmrZ+rKxt7jzbPubnEzGzPFJDyyswT
	X74+xrkFYlNm13uE3rLPpzvK8hAVdryfvUslkQHtS+HgeC5F5tsKDLEBnc++Y1abqCQ=
X-Gm-Gg: AYBFou2uFfTbMMV61Zy58mvcUlR+X8AGKJCCnyOe6oZO0fwfyu0eVjz3JzHzKBbF+vL
	JXjsleXLXmKcTb74fJ+4fRFqhYDs6x7KIwJeKgyostvTha/nXavr1qgo8MBoTy5DthmJNPAmlOa
	jyCIBmcFcnKYO7CJEUfqC6BG042i9jo0rROzCMx89zFDMJHPju8AnLPHq+6r9duey46AMVyi0UV
	vc3K0BsnVppmNF6cuOqBCuA7zsipWKnFRbC1xIEfB+QfsoQUg2VFlH2djC13oTzD47LecnvDPC7
	ndDLrrSuhDIst7kg0dBBJPCMIMqQAh3kKvo28Ubuh3+C/90tuHzAvruPsATEkQQZGDuCwJJLuFu
	oxjv2Y2rH3ISGPvcpQ3BGT2eQF9nefODrRim8Gs4Rhhsv4WbrH7dRFHM79snZXQcwBnTAEIyet7
	9AHvj2Q4TuTTv0kx7kHuEaArCIWLNEB4lYHp2Qbu1M3trBSyQNKhMNaAZvqrYtMZllO8O3zzNlG
	zp3aJNtjswIeFuFEJ9z+zclD2pIjkhH3UpJd5TRGSdVFSY/R1+aJJJQ09RVEaDzKAQ4BUjiFaZW
	qsQSCNFlzMB7RmTFDlOxZoiME9ka5wxpr1sOWFpOf7nH9w/x2PhXT+Di80wUYZ0ABgb1BevOr4/
	U0MbLfCnRGSPtQzbJYVNJrq7eXjlMEwHsfJ8DxspzSVFPQZgTf6L/FJcax90tPwkhzw==
X-Received: by 2002:a05:6122:d17:b0:5dc:d0cb:7d74 with SMTP id 71dfb90a1353d-5ec4caa66c5mr1844102e0c.2.1793219825199;
        Wed, 28 Oct 2026 13:37:05 -0700 (PDT)
Received: from soleen.c.googlers.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4f931911sm3001789e0c.10.2026.10.28.13.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:37:04 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 05/10] liveupdate: Don't WARN if tracking a
 retrieved file fails
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-mm@kvack.org, Alexander Graf <graf@amazon.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Christian Brauner <brauner@kernel.org>, 
 David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, 
 Jonathan Corbet <corbet@lwn.net>, "Liam R. Howlett" <liam@infradead.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Samiullah Khawaja <skhawaja@google.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>
In-Reply-To: <20261022225035.377445-6-dmatlack@google.com>
References: <20261022225035.377445-1-dmatlack@google.com>
 <20261022225035.377445-6-dmatlack@google.com>
Date: Wed, 28 Oct 2026 16:36:59 -0400
Message-Id: <179321981903.1894369.6363169044837754945.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=856;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=9m6WB2manDNmHNkWWaupqwLfpyUxuStC4em+E8XaZ0M=;
 b=kA0DAAoBu3coTNtzet4ByyZiAGriXO2ivBwzasr17tc21/VkmA5BpaNy5weddLAF0Xq+WI3XQ
 IkCMwQAAQoAHRYhBEExqpPstG8a8H82Yrt3KEzbc3reBQJq4lztAAoJELt3KEzbc3rePOYP/2jt
 cPdYHQOGemXNJXRL59xPkeLyW7o1RN8hKWIyLuuP6Ug2pE2KyooLVMtwE8WNXTanREsAnV4iWbp
 18DhLZiTVBE5EkM6/8QNoxAZkBSDn4wK+ams5b+mlNPwywvyaEBEZ5fKKScmaNRUCAewpICwMLl
 6MMU6jooZU3sPMbiNKXJ4N2gI/L88JDIsa8rjkt77+VOWxdfj7cWe04yETLsWkQM10Hks9z7s9X
 ZOWlM1lzsqqXduBkm7t8oYWd3s3WaFw0ZhWD3Jv1SpMGSr1ClSSLecw81Ivne6/TsksTGXzubO7
 calTT+OWXI6Ax7nJh7l9RnbbkISeFgCF1AvY+QBFDjjZWEJTG7Nr0os9xXrFOrGET7jEoXdiT7C
 jarfhSDZOjpTla4/QTgYy5aknwkd6vMf+cTDxSZr0ncV/ztL67ng/SAo+XY2X+LJh8NaLiSyawU
 kESqNdn9F8zlYnkqd76MqKhhnynb2Kl39nk67LtMiZ67kERKg2TIvDyk4/+htE8bVfSCyWrbbza
 9rmcRPjKqVYqc0R782X+ScurAwX9FCOEeZ1pGnyfxpn+KWMPQHz5KhiszhkuX1NuJ3nRTt8rwYp
 TeWhBbAFasJNbFxFUn3xnNwQ/MPrJYtpe1iwAqpgdB5suJ6Wk564LOw8NLWPTuZy1U3/0vj/x6P
 YsuVI
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Thu, 22 Oct 2026 22:50:30 +0000, David Matlack <dmatlack@google.com> wrote:
> Handle a failure to add a retrieved file to luo_preserved_files instead
> of triggering a WARN_ON(). xa_insert() can fail with -ENOMEM, and
> userspace can trigger that with LIVEUPDATE_SESSION_RETRIEVE_FD, so
> warning about it lets userspace crash systems with panic_on_warn.
> 
> The handler has already consumed the preserved state when this happens,
> so make the failure permanent. Keep the file until the file set is
> finished, like any other retrieved file, so that its resources are not
> released before then. Finishing the file set then erases the file from
> luo_preserved_files, which does nothing for a file that was never added.
> 
> [...]

Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha Tatashin <pasha.tatashin@soleen.com>
