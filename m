Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795457622;
	b=1fEvvDFuqqTtbZda8RSn9FxC06/28M5+9LoMoAvElaDf1fZJd7rWVRa7hNUdIbtZ5/SP
	 6laPmYZo0LlsTVjMgaQ+3tXfCiehaEAuOnM1hhMwX0JJoZEo54s7z/atV76LQU4TUMETe
	 eMJj3VJ3z8/V2xWwVqK+4IIS4y5rTBNNf9s9jfAX75jjYE90Hch2hbbU8wSrrVjrisJ8+
	 pBNik7+nCrLahypNQoZpwv+E7NDeKeu8wY9IUsih8Gmy4q0iPEuYhg93olxKYLgakIH6S
	 M00O+fcYsk0x5f/GQgZQoEVaoeGA1W6QAOEBr5mwjjZqkXZufYGcnEO/XqBAoUG7zPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=JF9DK5BWLD1MHzXf1P6k3Cfpg7JcJUIjQB9CILaEZzU=;
	b=SpAHjpo0Ozz5ZLXci8dgzezc4aZQ9h11VfS4+A1JIyBBGsfQPjCZFF8iZ/yJ8kJtly3Q
	 eVzoV/lxk3U13vkouBgVkujMNLp8bRfz02jZms5yKnIekoFlKRWBW4KceeyYIPd1DJUP0
	 YTzdaszGbBF/w6P3Dbfxz0ptMxMhUbefCE3Jgc7CYt8C1tKk1KKIcsGd6etDcjhSZHEfi
	 WvQN0mlsRLyb/FTJaXKuOhGVWduL/1lDaWHFM63D/GflPv1guziLqAE5ppJUFD4nWrf3z
	 6vLxeUVzMVxq5boOTRd/R3lo9knGp926wbJ+BCjLVTs+7IsETutHgY++XzeO6+uHMNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="LQWETw6/";
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D28606A31F
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 18:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1D28606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LQWETw6/
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a07078200fso1817003b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 10:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795457621; x=1796062421; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JF9DK5BWLD1MHzXf1P6k3Cfpg7JcJUIjQB9CILaEZzU=;
        b=LQWETw6/ke0AGLdFlDY+tyTnXcM9ROpZvf/O9lyXAKa6wTIzmashTimz/E8kj1KApA
         wb4OsxJEdFKQdpnrylbAc42fPkjMV9KF6K5tcEN6czX3uToTayip/oLkXxIG44Oewo2j
         MnnCSjRgOJKruiyA99C3EbhjfljR7wIStjR/a84mepa1x1FVSs1JtWc0fFVh63kUIson
         HJov0EerlPzZQ4dQgXomLFGaaoxSNLWEYtE5swf8nnXCl6H6b0kleCeF4Zv70ND1cx5a
         IX5N0gwKAPBH3iEnAfOKtpavO5WHYBp1Hokm1R1yD5Y8sY5kTe7kVg+IWh4KLrEAjnli
         PRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795457621; x=1796062421;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JF9DK5BWLD1MHzXf1P6k3Cfpg7JcJUIjQB9CILaEZzU=;
        b=Wq/3KEBQl/0BnYaImVgl9mztz1vd6Z310SS5O9DOBZX8GrhbHBJtlAZ6WsPRtAgsAz
         jZDu6QxbxQzjTIGIqJsCjigs9djkK/70dJN0p7LfgieE0QzwX3Al0dfLnkSPljGjoSTS
         UP1Z1gvaKUzdbuUQCYxP/vS8HfS8eLSlZMgq7NC6U3K8Wvj4qcNgt3AnyUP8i2fgWqjD
         2wTQcgpivVeGRvLQlxRV5oNLkUw3goFgAkY+4rRFI4J0SBBJ21yk7eluf4DoHb7oHQ06
         70ugOzcMgUNvCJeZZlM3TavmCJyRqjJ7RPAwZBMvaPjm2Sx8o97U/5OFPyjUACKKg8Lk
         mfNQ==
X-Forwarded-Encrypted: i=1; AL+hErFd9eRiS8YlBL0VM3eKh8kkLN8mgk/dVWrLBFYsQdbClUd7pyfPSB28qzVdNkNNXnOby3ggFyFEUU4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9C7hqADDvLd+tmrqZFjyNHPWEfdLJWKBO+X0PcYN/DYSuiCOOk
	Es1kCjDSO6AkiiwW50VsgJpNwzZGFynfPvNex/aWcDIFF6lY7n5HV6ZsBEAS8DYllg==
X-Gm-Gg: AZFdTZczcwHNrqRPYtSegxckgFl9LwBLwa7OkoocxEPyEtnB9RZjNlVTHeR08rV3P2m
	oHuN89NfC3uGlWaGqbRYUm0U8Z8rzCbrjl+zZ+h4apozpy64AXsX3zbZ0BFYO8FZi2flk4iOzRh
	Eez8Tq50vgIHyEXD3PDYFl5G2q/3yJPCg+LBV6mE2bp0nFhLfGe1tnxLHNc+0VMGhMuhjy4o6ye
	hPn+EoZe8CQH8zbF0qI/lHrmoYSbyYPrr4XK2Wry1ZdrhA4JorIMFfiW3KfMCoqHHVuJ3veSJbf
	Kc37LW+fJEBdbvMPqosuFGMQ8FZ5kKpoOpX9fDcv502+wQChrBV9PUTKB4HviCJGXWSd+sinZrV
	b1eQUz2IMxLB6Hml9AWjvnpaLesnNmB4h9kpdF/XpOufE2p0byj7BjD5dUVVHXjPAWVBydHpBA3
	IGhWMWC14ddKLohdeGx/pOyXpDTj1Zp2eBDbiEOqMVxKe0PfF9iiXlSAXWhwK3s+SsIz04dR3V8
	YEwQDkDKLlik6qwCE/UF+a5eJMKmKu/fu9OFEMxOac4HjRsU+puoY9JDYHqMhfc1brcaaT3ljHU
	s7+8whzSHzaZUhIsmZ5hPtw89aWP9iR2HYUQBIp/hTrOSvWyXRrTkXIEsVuiWqU8
X-Received: by 2002:a05:6a00:9084:b0:89e:9c7e:fd56 with SMTP id d2e1a72fcca58-8c87c768251mr11001006b3a.33.1795457620349;
        Mon, 23 Nov 2026 10:13:40 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c263sm5956386b3a.11.2026.11.23.10.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 10:13:38 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 10:13:37 -0800
Message-Id: <DN2SLUVNO0L5.3NUHFPC0J7QTG@google.com>
Cc: <kexec@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-mm@kvack.org>, "Alexander Graf" <graf@amazon.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Christian Brauner" <brauner@kernel.org>, "David Hildenbrand"
 <david@kernel.org>, "Hugh Dickins" <hughd@google.com>, "Jonathan Corbet"
 <corbet@lwn.net>, "Liam R. Howlett" <liam@infradead.org>, "Lorenzo Stoakes"
 <ljs@kernel.org>, "Michal Hocko" <mhocko@suse.com>, "Mike Rapoport"
 <rppt@kernel.org>, "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Samiullah Khawaja" <skhawaja@google.com>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Suren Baghdasaryan"
 <surenb@google.com>, "Vlastimil Babka" <vbabka@kernel.org>
Subject: Re: [PATCH v4 07/19] liveupdate: Add helpers to track the files
 that LUO manages
From: "David Matlack" <dmatlack@google.com>
To: "Pratyush Yadav" <pratyush@kernel.org>, "David Matlack"
 <dmatlack@google.com>
X-Mailer: aerc 0.21.0
References: <20261111002358.1842967-1-dmatlack@google.com>
 <20261111002358.1842967-8-dmatlack@google.com>
 <2vxzbj7j3ga2.fsf@kernel.org>
In-Reply-To: <2vxzbj7j3ga2.fsf@kernel.org>

On Fri Nov 20, 2026 at 3:15 AM PST, Pratyush Yadav wrote:
> On Wed, Nov 11 2026, David Matlack wrote:
>> @@ -788,8 +797,7 @@ int luo_file_finish(struct luo_file_set *file_set)
>>  		luo_file_finish_one(file_set, luo_file);
>> =20
>>  		if (luo_file->file) {
>> -			xa_erase(&luo_preserved_files,
>> -				 luo_get_id(luo_file->fh, luo_file->file));
>> +			luo_untrack_file(luo_file->fh, luo_file->file);
>
> This looks dangerous.
>
> Since the previous patch set luo_file->file when xa_insert() failed,
> this will trigger in a failed retrieve. Except, the file was never
> tracked to begin with.
>
> While I don't see anything that actually breaks because of this today,
> I think it is a bug in the making.
>
> I think the below is a bit better. Although this change probably makes
> more sense in the previous patch, since that introduced the problem.
> This patch should just replace the xa_erase() with luo_untrack_file().
>
> 	if (luo_file->file)
> 		fput(luo_file->file);
>
> 	if (luo_file->retrieve_status > 0)
> 		luo_untrack_file(luo_file->fh, luo_file->file);

Good catch, I'll fix this in the previous patch in v5.

(But luo_untrack_file() needs to be called before fput() in case the
latter drops the last reference.)

So:

	if (luo_file->retrieve_status > 0)
		luo_untrack_file(luo_file->fh, luo_file->file);

	if (luo_file->file)
		fput(luo_file->file);
