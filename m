Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793835525;
	b=LPC3V2cfQ8iDpJY7tilEQkb8ssWA75A+rtQMmCD/iwD8U1O3t4/XKmx4Q+8WQx1keRMC
	 RUIL9Eh8s8viTZTPyGlviJDI81Yfo/TfYuKWvZHwTXfTypU9k+hLmgx9wYVREjGMhrsDt
	 cSMSnSi5XrRPTTnINII2eXHJLTNNTBdcAeqfT9YF/wvVa74Zjvt4EegTI3mB9mPsVc3NX
	 UqzSuvXnEdTOd1AyN/PXnYTzprS+oeYVpZhLBxgoGR8dj0MFWAyKJtXTrX02ieqk2DA5v
	 ZJlT4vKbZw1W7Zh6UOuUggxPDQXXtebptvfpuQTzfhPPgF/AkJhHuPYp8deYqkm5vow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VoCFEISjEe+3bsOKsg9RxmedHt8FzEUYGSYFsiV26+U=;
	b=a5Vz9+PS3h9jHbqDUchm9AU6tkYf8veoYqE5kg4M0N0OBBebxyrkzEnTs/U4AQR0bA+Z
	 Pm+YRN1j7M2I2U4FJnqJLl+g404jKlEBhr6Kl68LLu9pcuKyOcOJkNlr3aIa8V341Gvbb
	 typmPJ3Mi4SNxSeIc2MRI3xiV0xDsGj4hP76gq2t93yj0BdDDEDm3CXRVnVGHCraOMniE
	 C9TpDw6Y0tsf/94xNk/dX+Ol4Kd5DZ4LREyyb3Zq8SgxPFS4ki3+AuWWfIC1ep+LlyG5C
	 D9e56JiiqmISqSjcttnJ19Jtmqgrl4+MULnpKsWCyloJZ+YG56RroIsEBQShfZf+bTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Zw+iQKvo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3870F606A32C
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 23:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3870F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Zw+iQKvo
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso225058766b.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 15:38:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793835523; cv=none;
        d=google.com; s=arc-20260327;
        b=a6a2BhKIMvA7vrCiu/M+x+P4P2rFUnc611MJ7RQeZBl3weGCjZnJ3pX7lc9xdpRw28
         7CJepCDJnlgyrT5i08MQnPxiyDfvQ+7iwpGbRRG1qkRl2Rr6sAd0VQbqhGiordKclBl6
         pk2YVME0XV3DTlnBRoW/toKowkfdWsZr7LF/F/j0O7HEhxdW3UocRYZoQfRk2YlVzwyM
         KbjCph5kyADV/h4uDmfBHZk7505b3ylWFuvEf4sqMTtzvbE8KlNPMp2xrIdBrlWQ7h3A
         sugW3LUv1imeYJwzG4K4ncCg+4NRF3lMB0j5tyQtYaw/mxfAxtxvIvPSKpdHnQezdlKE
         yH9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VoCFEISjEe+3bsOKsg9RxmedHt8FzEUYGSYFsiV26+U=;
        fh=FCRbQZ+ob4Le/CWsAjjuJTiBg/BA8VCNywcDyXKxqnQ=;
        b=auawvzeYEOP3VDS+wm5MwiFzTzikJFpuVaew6IelJupeBjsxYjBy8njU1ENcmUfx/+
         P8feXP9OSob5uNsc14CtQbT1+zX1nsc/kE5elhVzUUrrARxo9By/6eVuZNGLdQyl8m6I
         bxG8Xpj82U9aq2lN9HnnpXRLXVxM2K9Ks8vdhL+tZ1uZLF2WE5zs3y3InzRFYHcI0NPo
         fMUW2d8JGNyWAVcdzfw6QqwvDbXpAj5krLdkXq8hSw3VOvrvLl6/Rem9YovyTkLtboQD
         W863mKZxpNEvZoeUKFYRwaltn669zmsbiVORKlPnnf62wc2V0yjXemnrTPDeRn3Ylzfh
         5Fbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793835523; x=1794440323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VoCFEISjEe+3bsOKsg9RxmedHt8FzEUYGSYFsiV26+U=;
        b=Zw+iQKvo8Yf8fVczV1PDLI8KZfnE5zD0Cy6JTEk5mrT+ANTk+Lt+hMyZL8ZK+hzaa6
         bdqHCgHYrXD2YptQvLE7Xs4RdcioPm+8dTdjWrF0y1UvAcJHzjXYrzW35/rratZF8luu
         LR1Wfc1ZIZ6BPQyvDsP6kpM+hMcU+zgNW0NkUJ0rGRFONICywRUEtCAH52e9elPlgdZT
         dVEwy6CbhLCuH50RF2GvrCmQURfOLeWwNap7324DsLlv5ejmp38bYmN6gR3tU2IwBECa
         UbE20ltlRCZZhsZNjTY9YwNlfgCgHQwcVRFqXrQ2vprEK/KNndD8xQlhHD4A7AcNrgF1
         lkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793835523; x=1794440323;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VoCFEISjEe+3bsOKsg9RxmedHt8FzEUYGSYFsiV26+U=;
        b=JGhRjqolJvjJbEW5IZI1KBUTvc7/3+9WUazGuaPy+pLxG89pbFe1ONO4uXRuPcCFEo
         zkngdy7eMtGFwXs4/hhjmOiufdpXJfiSL7pFBmytxZZ693G9djc6Z1pLHkoc7W3LQGRm
         du43/AUKpBZKJ29Feiijp2d2qGVmg1y7gxG43VKZT1oczSumlxAV6TrWhT5s5n84JWnX
         +K/AFBa/GgjTguFz23DoNgEMxTRrB5ketmlRrj7S0ChnhT/UQ8R4KyQPRz1V6Ys086hb
         IJTLktIf2XR6epAhvACqT+ag6oG/xIXNKbQZHMDDdh721uz1R4ts+gqnv1JBf37zE+r6
         gvog==
X-Forwarded-Encrypted: i=1; AKwUvBwuXE9lAiB/QzdEhKTtcdFaay3R483tSTpMatgGKMTcnDQ4B7BnXbr4GNRH2nW95+Fg6Sl6p/LblJQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z88nIIbvskg4xk8sIABEj4hc8nX68/mZB0OwIpXk7NpiUvKvQrv
	X/uFC/hVD67yWp1o1QiLfzv8l11eU3iy4IM9M7G2HJ38G0wc+HWbCoDrRHinVE7c/EaNKT3V6OQ
	Fi0GfahZbBGiv938T+Vcr9eKRfHIPffbwpEi9jSttA7kZxJBJsztNkWZBjAI=
X-Gm-Gg: AYBFou2XtCAgtzQ4KdioU/NCFyx0TaWPESjQvRgTDnF0RMCnGF6Uok3/MIvyqc9s3+S
	fp7icsgDcb+nvL99zyx2mgT+7PEU3WjO+DyMSXIgksbzrBvmvzZjnW7+DydwLIgvv9W7yK0xf4M
	cR+Hu254GijpmOsJWTSmtAzXoh3mpIF818P9xfCVQuaWeOkdcIA9nGuNYcq6lMxt7uESAvLhjrW
	LvPoNAmcxaOVSkDyHqd/7mT5H4rpxa/0AmduhYJcSy6ylW7zpe7bxImMFcVJ3AbAzQxjTVurV32
	pMXkRtiYxNF6pckTZWg0RvFnZYe6l25NjxPrWs0XdJwU3l8yNkewVK0H041kcHSlb7iase9S5qB
	B2nEfuRwquoRhse/dr7sQBFCxAXYNNPL3bCPL5Q==
X-Received: by 2002:a17:907:9615:b0:c2e:893:7010 with SMTP id
 a640c23a62f3a-c4ca7ab1105mr1606291066b.37.1793835523294; Wed, 04 Nov 2026
 15:38:43 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103010216.3447716-1-dmatlack@google.com> <20261103010216.3447716-9-dmatlack@google.com>
 <2vxza4nok0ji.fsf@kernel.org>
In-Reply-To: <2vxza4nok0ji.fsf@kernel.org>
From: David Matlack <dmatlack@google.com>
Date: Wed, 4 Nov 2026 15:38:16 -0800
X-Gm-Features: AclHuK8g0SSTWzLAJK32VMTa5tPkJ4SYKSZ2JyPLhAu2cuQYk5IO7KP3qYgSUkY
Message-ID: <CALzav=cjq0FjSRe_KHns4sGpHtspVy-5DBdo6Kzg1TdQa1z9FQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] mm/shmem_luo: Allow preserving tmpfs files that
 are still linked
To: Pratyush Yadav <pratyush@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, Alexander Graf <graf@amazon.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Christian Brauner <brauner@kernel.org>, David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 8:46=E2=80=AFAM Pratyush Yadav <pratyush@kernel.org>=
 wrote:
> I usually spawn a subagent with clean context and a high level descriptio=
n
> of the goal to review the changes and changelogs, to clean up these
> things, and then of course review everything manually.

This is a very good suggestion. I'll do this for all my patches in the
future. Thanks!
