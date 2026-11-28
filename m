Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795827602;
	b=hlPfVQbf8mLM4RxJJuQ0x+45FgLrOFsDA74wzdVhmrbxNSRvBaIy0znZiJGahKrdYr16
	 /PLBNBzc5BsYf6MUcmsuiutBYpO+6DhDEfOE/pqFaj0EGXtvi478uP3UH3sTT3GSR+OY9
	 DZ8H1RawSuVb/64avitPweAfipoXdvekpntuX1jEVhiMT71Mk33X+X/h+9za+ApQl3J12
	 obHiCjE3gtKGxv2p3hMAo844giwQSAZonnImL0mBoHjyQlN48wlij36QD3kYQ2Z9GVJoS
	 WWwrg68V4rAE72D++u09tIJtpaXYLA+oVNuwkYDg5YQu1q4Pb8xOVkG78QE6gof2SQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795827602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=r4Hzxb3NGCSSYFn+Gm/a38nZ3OBSGBwiKOcgfEfvzmI=;
	b=1lWekzS56jiI5Qxa3qTsykttgTrDleB3gqCnWQEJ90/mp7WkOFz0UXJEHHyIRw3ikXmB
	 Am5bWNtg0kuMmA1cpvO2+mo4I/YeVS/7M3zE3bZj5RetgW/++UluuM0VxxbXca0Lshl7V
	 V8I8uf/79Gz9tffH8bt6345Jv+KemX27e+Ambxd7AlV7wTIC42upgO1i/j/UQxdfns74n
	 QMARD/5Zv6mMVMLHGPl6PvTZcbNJhxMacxQqz265XEIHDQQBar96KY9HFiGfTs/rkGycH
	 6m4hySom2d2LS/PXp6pQVP4PSqD1/53nBEjz71qOKAD8A35iwh9bu3N0AA6vdU8tvuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=NP1xbr9a;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341B1606A31E
	for <linux-doc@vger.kernel.org>; Sat, 28 Nov 2026 01:00:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 341B1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=NP1xbr9a
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b10d24345dso78727477b3.3
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 17:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795827601; x=1796432401; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r4Hzxb3NGCSSYFn+Gm/a38nZ3OBSGBwiKOcgfEfvzmI=;
        b=NP1xbr9aYchSjWccz1YTXtcUDfu6Kfw7+2E32BWhvFBJmtxKt3JqsAbSmWtkpkCxvJ
         /n9tD+yjbaBtMGWG+AOAC1Lc4BDVGli5hZj1dVoJsB/Nz7WwUmsK0vXUaXNixMLnjPnF
         /zr1HcO28b2gmxi28F0WybfMWXJ+PgYtDJlek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795827601; x=1796432401;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r4Hzxb3NGCSSYFn+Gm/a38nZ3OBSGBwiKOcgfEfvzmI=;
        b=1nXJrSXVETt/lPTbiKL/xLYRN7g8d7VSbwHykbRGwoFhIgNABa2W7LsRGAdcRMdXdX
         ChwyD7pcx61yq9LUGzko7VBFS00hSCaofMmO+j4uT3e7J1iPh8e0R5abfTpc8ryBgkso
         Gr7v+Ed4rGHj2zlj9JsJye1ZNu9B04gPZkJIFSCCjdLNbFgQ66roI1Rjzaiu+i5LQjQC
         SwANiGSCrmlRKE5AAJYRN7WFy7LTnNnUUvWr7MdQLUQeV74UB0VOBFHN/tyQkS/5CZe9
         9UCe708FjKnqVL9JyK8g7zxWXNmY5hTS+qqbg68ppM6Na+SkYJSJGdAXk18MSvAp63rq
         XxlQ==
X-Forwarded-Encrypted: i=1; AL+hErHKpuhc0pixrPj236bCBifLqc3FThIlA1/nLyUF7K8yadp5znmip68nryS1nm5yDTbi7Dp13xEly3I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/PK0tLlrdmBNcvmivWO64rTRfho5fEbjH7w/Dfj0xbhlj8xIq
	Z88LYn7qFOOHfTILb/mgSIreg9h99u1cg1Zngqpu6BSOFeN11/W9wBfrMOZJJqSFz1c=
X-Gm-Gg: AZFdTZeo/WBMg+isXk4JW2pE3uXLmE9YYAVbwwlSgHg1VQcbHJq7S5OFMgxgzvPwqZy
	PdlrHs01KsThMJjlqkr18TVfhMwOno0+ENcMM2AmAPCe/1IbI0hlxx6lWqRruDKe8YbAppgAZ+o
	iVMCfYTctTzHg417GDo+t3SbYJjAZ8+denv1wf4SClsiy0KDxYHRiZqEhFwo7YXjMRLPbuVD5zE
	MR812j6ITdmhVE2BtWil4oA4DXerE/I/tl+kcxk6VEd1dzD1jYik2AbQVl3AEfdBpAAum0NS0cb
	xTKpRzZTnvgyBSXQJnxcs8YPKMbv/seg+2N7pSZQxDVlywIVrzmenj9ot6C/mZDlCucNbofR6Jw
	j2J4f0+30iexyXf+25tma8SLXkh3BRmJ6+tobvpaaJIjqM1NLe1NKHTW72i2NRsnuuiZzbucTu3
	wUOoEpHBwZtQZjS++q5GnDc6Tfja8XDfSc/e04ij5A7GlWBrMt6Hp2SQZUYAQzvc/sh3+/UyDab
	wbeqdovX0gByfE3S1KXWA/KXcXQ8PcQe/BFaNGSgll01sVTUVX79XGmb6WyqWRJfmqNiBaP9L5J
	ItvCAvsz2GawWw3X6/hFPcr04SIrLKVzRMORwJNAVHeKGFYU64mgnR3hYemH8diIe92plh5uaV/
	ohaL6mWah1uRtXG1reHUkbEnZeA6Bs4rhRqQ5znuss/ySS53yoNIKQkxBxSStbCKYpshMoOnjwc
	3XnRDClvqoeThFdn4YLyvSybInD9ehKxperR3yy45FBISUcBPvpHoFxEwUnsq/W6gxThLVx1cn8
	dgJkVxfo05T6/jsUmtKq3I=
X-Received: by 2002:a05:690c:b86:b0:8b3:4911:2dc1 with SMTP id 00721157ae682-8b5204ae0e7mr116512127b3.39.1795827601141;
        Fri, 27 Nov 2026 17:00:01 -0800 (PST)
Received: from [172.20.0.2] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202bf474sm101002207b3.21.2026.11.27.16.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 17:00:00 -0800 (PST)
Date: Fri, 27 Nov 2026 16:59:58 -0800
From: Chris Down <chris@chrisdown.name>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, Alexander Graf <graf@amazon.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, David Matlack <dmatlack@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>, kexec@lists.infradead.org,
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH 6/6] kho: don't reference subtree blobs as FDTs
In-Reply-To: <20261127122536.3708770-7-pratyush@kernel.org>
References: <20261127122536.3708770-1-pratyush@kernel.org>
	<20261127122536.3708770-7-pratyush@kernel.org>
Message-ID: <awonjgkHO4wSeAGO@chrisdown.name>
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
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Pratyush Yadav writes:
>The only functional change is the rename of the debugfs subdirectory
>from "sub_fdts" to "sub_blobs". Everything else is a pure rename.

It looks like two places still refer to the old directory name:

    Documentation/admin-guide/mm/kho.rst:110:``/sys/kernel/debug/kho/out/sub_fdts/``
    kernel/liveupdate/kho_core.c:1099:``/sys/kernel/debug/kho/out/sub_fdts/@name`` when kernel is configured with
