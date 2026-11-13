Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558660;
	b=WVJ2nQnBY/Srl32Gcn0K7Mnm52qeUu6c8rXMReEu6W9+XjFWMjwMZLjvv/AI8qDvJpA8
	 r3XxLlGZEwooNsKW/Cax8U87Py38QgBL3Zg98+pORoWi96p3uPcwqWRz2mjqAryTEQqFv
	 Ncz7pHiFElT95PzyILUaFv1sUgpZGCR/ieRwMutXAVp+0dM4RHMucbLqj2iYZzbYbj6Ro
	 CJcUgk5nuo9PISCfCUoxqx821V6K+tDxJp/x1owG2Fz4vzTmToAHWziu0H9TBsmxEev65
	 XQwlSElDw+RqofqBosSaGP1w7s5DBSn/k8qboV7MMpjGqb9CBCwtjZoQ/6EaMs6f8+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=f61a/DEp6A2hm2rkE7XwudvGQ0m98AaZhEeJm5iO0+E=;
	b=1W4/uhsjGMOlHzhCphjrAXtvZFRMrN5mMXZMqqb+1B5vs3p0lTuiG1V48i7mv5Tj4A4o
	 RBnmE+Jri8ck2XSIVjFhL7sFZInfgj2jFqH3dUwlvuHRtg1KeySzlIcw6dLXTX+RHE/6m
	 oPJb1SvyeGUArUfOqd0B5WOYOSRmPh0wutvQ/FoZtqXXiPN6kCpx9clmvbMFqybxgc/KC
	 qhz+MphBujLzd8GOKBlaKDSt/tw5ctIi0xGZdoYofc+8xal4ncVR5wV1IKRvRaUqLdzia
	 6VXH2pit+QJOx0XDIr/mbAlJ4lz9KinZCM5Xb7seqXPZFOOlmplSGcvkCPprtwv3Qng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=sRaNMk2O;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD43606A886
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:31:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DD43606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=sRaNMk2O
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso4164705ad.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794558659; x=1795163459; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f61a/DEp6A2hm2rkE7XwudvGQ0m98AaZhEeJm5iO0+E=;
        b=sRaNMk2OSk/a6aWGOqOWrMugAMmZ1cinBvSaGXXuX6T5FudhFdHlZzEHowq/jIOZ4n
         Jzw04d95113kezBuy2csxHVIWCaqzTBp5Wqjaxn+c/Pl36oVol3U8iwzvNWwqzlINMwY
         dUj5skD3W8p1FyAHmxD4xgC6UJvK3jssafyMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558659; x=1795163459;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f61a/DEp6A2hm2rkE7XwudvGQ0m98AaZhEeJm5iO0+E=;
        b=GnDNlwFm5DRwiDplZuk83y+YyeRKk1tJNxRVRbF7jhdyXE4snt4WY1TF5FFcd20ZhR
         U3BbIsmNbdrpfGuannlEekHMBaPjZAFQJ4sSpBrJxCSFuwV+VXioNLED8DMvoU8zbwUd
         Nw3A5nyKBJed0BP5HzqCkJ4oalgllqAzYarJQLB/ufxqS0LGUGCWAVQ70d9f38Vo9wvf
         Vi0n8htufsg8s+hnyiZZfc/bU6jz6EWh0z9XBouQ6aTRWNFXCXdrhJoZ3Ih+LrR1M+yR
         Kqah17bRQNLKoxtwCj7Vxh1kCIWmqby1X9ZewcmvE4232bZ22UhFSnQaPuuwOoq8gtuj
         bNZg==
X-Forwarded-Encrypted: i=1; AL+hErEDTcvRw1UG0jAQ0rMskRPLdhAB/m7GxrM6XR1JdV8JbIh+ApZ45oDv5gvuxaXIRbX7SzUw4on5A48=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1+uISqFze0uzPjaaEhZFhsYBNG4W9gsqmoszMp9NPl/Dfo34Q
	4IfyjIG58zCI3Iyeg9KaUNBi+aMPBOf1j7ygkewCu8s1y0o9tf2PfMYgrPVCDV2DM64=
X-Gm-Gg: AYBFou0D/TTjqKz+GPSePVa1VHH7Ozhoiv0g73lgqLwOs/tLg0PujH6jx4sc0eLFvOr
	kh05i40Dcbf5eYU/NTR9QZksXBxlaJ/aGMzUYYkVdIVgsGrYUSPE258w/DzwA2KEGDdlB/nVfVn
	uLyWjy8cQJhbrH6Pilf1Bbow5c+ITiovS6+P5EI8GhB1DSrzQDjd6DJKLMawxbF0+jgxQdgt+5H
	xt20gmodZC6awJlkpdfQRqQ7ZeulzcUgm/O26losp5UvRlscRp2u8OTyk9kE1H/surtQ/FcuZ+H
	yCJcjEub7X345zQugo6IDd9QGJtIdT+uZg2VuTughOcnUQVlWCDKk49r5U51nxWxGo8oFjLd39G
	u8Ckgutb1VSneY2EtMtS98uxtUvycHDuHk9K6sn6xGjcNM1pZna4UMxmU16V+KrEUuBmPqyUT46
	mG9EuJ+ZXI8Fnqk7ySmyou8ix1Y/P3pIsAUqCAvGWSJTHbZyhb24Zzfrkepf2KpOn5O950upzcN
	bppUaf5FbBdU06K6SwyNRCza568ik4bh4oew/SdZqa245Bz+Xib8ioc3rxnfFGFEAoYYHNd5nXV
	hy8Kuoza75JAgclfV4nfzIwoqpKy5GE6sVU5vrvkmPvzZRumug1cWJHFIflR6nsQSRFFtTf6Alr
	dU0hdlHcxQ2cODUUx+Tief++jTdekqkLx2/+5yTlb0Hv/kjLhwD3bx6u1+I1z14E/Tk/FOU/3R0
	dcXLuywe3yFLathwj1rsHWkdOtvldn+QhPHQosCy+6kflcEsPQ3RscfefXyak=
X-Received: by 2002:a17:903:228e:b0:2e8:18ca:5f46 with SMTP id d9443c01a7336-2ee0da7bf97mr17781095ad.14.1794558659559;
        Fri, 13 Nov 2026 00:30:59 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f868217sm6442615ad.52.2026.11.13.00.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:30:58 -0800 (PST)
Date: Fri, 13 Nov 2026 00:30:53 -0800
From: Chris Down <chris@chrisdown.name>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, Breno Leitao <leitao@debian.org>, Alexander Graf <graf@amazon.com>, Baoquan He <baoquan.he@linux.dev>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/9] kho: Reclaim the metadata page left reserved after kexec
In-Reply-To: <179443616043.2329176.17166425351392983946.b4-review@b4>
References: <cover.1794383544.git.chris@chrisdown.name> <63ca64c004b296a998a3e531f8c0c4964916b70c.1794383544.git.chris@chrisdown.name> <179443616043.2329176.17166425351392983946.b4-review@b4>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261113003053.1c951f5a678d35e3@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Pasha,

Pasha Tatashin writes:
>> Fixes: 76aa46b9e404 ("kho: kexec-metadata: track previous kernel chain")
>
>Do we really need to apply this to stable? It behaves correctly, and
>your patch performs a minor optimization by releasing a single page back
>to the system.

No, I don't think it's worth a backport, since it's only one page per boot.
I'll drop the Fixes tag in v2.

Thanks for the review!

Chris
