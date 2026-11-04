Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793773324;
	b=5mwRP0I7VvehDtO6anZPouKLOmRQnD8dz+NmO1SgU3KzcDqQjAg7oKtbd2fAg2IDUxaO
	 /5gSJn2idc+475Y9P7qRr5bY10XyOnx1dYU3Kd+S/TwiQ34Z33NWEBW4QUx1O0No/t2uD
	 Sbm65+yJEv6ypIPZfbopissPDiMqjpeuio58rq5MOijEhj0pbEKLRwPCvkddoFFLCnOY6
	 wCTwq41W23ykXsMr+x3WmMevpO/4BIupiKiNodrquWvyzZ0NMdcTsch/kvfCSiy5SHJCz
	 qDFX7cQA99m0WBs3NnTz/aDlBnt9tqHvwWaGoRphFDQLE62jzyETNYpy455M3tEiLNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793773324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=AqcQe7O5wAeagY/E7/oDRIMbBP90oX0eJ6ciW8cwB1M=;
	b=mzNaFDwEbNaDzVZkUB7+JeFFHyP1XdgFHfZ0POya4l/rQYCKamuz+cGrY/w3ED1sGifU
	 LdwfSl/du5vn6GlddyepjnJQsPiGc8PJMwKOudgtUVNB3wKgHCxBXMdqcmkf9QSL23sHJ
	 vc4w4czCXRcoH0NxNou2AF6dJGrR5+b98uAqVgrEuYNYKDmR/iP/A61+RJ+V7tvQrvRza
	 0EZQumWjyWe0gYx4rU2l0ssLNGnN4laG+Prdjprk9vO8lVoatCDRvkhM7s9vK7Weu5YSY
	 UERfmWbYDc5KWiSfBULGbMGfjIYydkt0hHdKz6Waw9jG4QfeRX+4cac5SpHjZdefm1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=l+fhr4Di;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD89606A326
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 06:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADD89606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=l+fhr4Di
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so605635eec.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 22:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793773323; x=1794378123; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AqcQe7O5wAeagY/E7/oDRIMbBP90oX0eJ6ciW8cwB1M=;
        b=l+fhr4DiGZDbmsbfHLl3m+wgauKtSWLKqV98f5SAW9wGnlDpA696MhJJNK6jVrGMxv
         HlGN9KAghZRQFwzkCd/sE09qxydIdJ5aVE/4M3r3I6Q2WtsvDgKLnsS35PPdj+WU0mJr
         /oEKimB8lihZnytn/TScXu1mnHXUX72pRuGJs/ldnN/GkB8hWMzlpjhyI13h/+eh+f9x
         1deNaLhHBmbFVB1IuVF0RQVCcXVzOc29nn5xQnGC/FCPZ6NRWoGeRBWeWxedByzBxao8
         VmKsfpdQbUnMeeZ56CEQ1QfAVcp41CABRLFe3Q1h2vcX/72iFXk6vPnLmJaOgBxAQOzq
         niyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793773323; x=1794378123;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AqcQe7O5wAeagY/E7/oDRIMbBP90oX0eJ6ciW8cwB1M=;
        b=zCyFpafPjflUPctIdsQI7xfhNz3HjrGeM3x8z4f6okTD3vjlBUVwS43F9wlM48C+UG
         LyLfIrNac23rdmtCie0D6/JnBEVKG927EAiCZ9H54YXF9G8l/IL1V/Z020Xks4RtVnG2
         xYNNnzyPgdDG6y/k7ucLLnT28hBctR+b2hTcHOqK5sjzU91nDEu6pxi39fRiHlKnpq7r
         nxHwc75g6FHeEg0OY7h7LUoXKAnS83RZf9EQJyHlh4Pcb6rZHv+SGP9D1aOG68Baz3NC
         Advrk7Oat5hjxhFl2qdsCprjyQPqSoDb/3A4icNAa1iys93IRirq3f3d2g++CS7IY9cN
         E1Yg==
X-Forwarded-Encrypted: i=1; AKwUvByLpJpc+x6cTez0/kSi/KycW8/zI88cgVI6saj5dwVrwRNd0HkmREgO+Z3zj22YP2gwxm6k+VU6B3w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0AIrQEDm5YXx7pPVyyaVeb1ADwZs20PAOo9hzdatKjyWwWouR
	ADtNBMDM8+wOpGWiEvZZJ2BeFD9dldIJlvEmAJneDxmHCuHk+2f2FsIMDZyyS6MLHwQ=
X-Gm-Gg: AYBFou2NFAiwiekPnfLpuVBpyfLfkbYzvgrNgUO+hs9bo5bdGPlWRjqRcLreS/8doa2
	pQmbWcDQS30HMEyFRALdtx+tC2PjAf9UEi51nRxghWesFbTJFWPmhIsuWWP7sY5BZaePiBFWbtb
	gzpDlN1BpV0gS950pfxdLWNVJpXTh6gIY/5EE14uMYQ7br0kvyheEy7PPoZUBXkNLH+w3cKwgPF
	dNjivOwqVzO1HmaCSZanfEjW3ebWiEs4UOgjoYtx4NQm2qyl4/1kJ0USabVoFqOuXOWtL0A+sTA
	hodfxtpPOynDA32QiG83FUmtMRI8wGdR3FERPzo11D5TYzu4YIx7QVslzPeLoWweB44d/SdAQwx
	9JNjW+Gr38SB6p7fdcY2ubg8bfRNYXObazAJLvn4toXFVN+svgIpwGyKu552accnWJl0zQiLuA7
	sQIulSRbzySrwuT1TUFNf/sGdTaVxm6C2267HWT5S+RTv9T2Hjj3N0WheGuySpuOLPEKuIZ1ODm
	TfstPBYQVmRR40QmT108DNYN4HUXeIc6Jsk23EJr5EQ2KXo4C5QaxrJRLFegn1n5kctIT3/7ZKY
	UKWsKnMO4lW+X+1YeyJBLkSk4U2jEnmKu2j+o2hxWquR5azmo0GiCnxFY9Y=
X-Received: by 2002:a05:7300:ce97:b0:35d:8c3a:38a8 with SMTP id 5a478bee46e88-36a42437327mr20872358eec.39.1793773322655;
        Tue, 03 Nov 2026 22:22:02 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F ([61.251.99.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3785430sm6173162eec.3.2026.11.03.22.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:22:02 -0800 (PST)
Date: Wed, 4 Nov 2026 01:21:43 -0500
From: Gregory Price <gourry@gourry.net>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: Bharata B Rao <bharata@amd.com>, akpm@linux-foundation.org,
	bsegall@google.com, david@kernel.org, dietmar.eggemann@arm.com,
	joshua.hahnjy@gmail.com, juri.lelli@redhat.com,
	kprateek.nayak@amd.com, ljs@kernel.org, mgorman@suse.de,
	mingo@redhat.com, peterz@infradead.org, rostedt@goodmis.org,
	vincent.guittot@linaro.org, vschneid@redhat.com, ziy@nvidia.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 1/3] sched/numa: make free-space tiering promotion
 bypass configurable
Message-ID: <aurO98PC4TTweJs0@gourry-fedora-PF4VCD3F>
References: <20261028041253.74839-1-lizhe.67@bytedance.com>
 <20261028041253.74839-2-lizhe.67@bytedance.com>
 <0676993f-c04c-4e4e-9f8d-1650c8fd6d6e@amd.com>
 <010b2b6c-8f1b-4c3b-913f-cc2e8b957759@bytedance.com>
 <a6bcd771-fcf7-4fe4-8c21-5e65bd579de7@amd.com>
 <1bab234e-8914-4694-b0aa-f265fa49c6d3@bytedance.com>
 <c9cf96bf-f3b1-47da-b22a-9600b5fb01be@amd.com>
 <3318a7f7-4dec-431b-9284-ec7c2807151c@bytedance.com>
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
In-Reply-To: <3318a7f7-4dec-431b-9284-ec7c2807151c@bytedance.com>

On Mon, Nov 02, 2026 at 10:56:27AM +0800, Li Zhe wrote:
> On 10/30/26 11:44 AM, Bharata B Rao wrote:
> Thanks, Bharata.
> 
> I would appreciate further maintainer feedback on whether this series
> looks acceptable.
>

I will give it some additional time when I get back to normal next week.

~Gregory
