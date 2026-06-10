Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A885D385D88
	for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 23:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781134988; cv=none; b=VOdBtodR4IFOvS7GfrZeourwNKhHr02UUeyJBKg9lbGK9NgveJkUqYSK5EO2HSTkg16pET0fTXrMZHsObUPnf3EQAveV2Yk30npHnYf96UVL95ziShzjCCjaNZ9lOPZphlbbQ8CrKXnVdDjFumfPEhUoGl1wx4ETybTgZv0vr/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781134988; c=relaxed/simple;
	bh=JsSFSoN44TFVz/6cV9BMkzX2QhQadkdQZzqFNXNwr0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ItieHhubpwVdlwbV/NdZF3Mn7q+AGDYIz+kE7nzO6AEEAPBF1av3044fM0xcKAQwRW9QufzS6j4L38tQHGR3neJaRtexRGWe5UA1t6WONCslATeylIqHlrrdYsVUgF9LDXiN1LeSDQNJ9I+ljjZX4nGpEZtjy+82GEgemXrJo+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUJBhkB8; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUJBhkB8"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-36bcbd7821fso3278636a91.2
        for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 16:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781134987; x=1781739787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=an0SgUn1oFV1bun03BprU1b2Uy0096MbOZfVjaHKMKY=;
        b=UUJBhkB8sfpvem76yql6tqKJZ/ehx6KUnAf3EaoOARnr2Ce6EIqJx0/uXQqIEvTR23
         GVFuRlmhrE4XFu+auh6oEcrhhgdbteoEdKv3vLDEP1dmD9t6OcGCAZfUxJWd8BS0PuzF
         R+xhGBLMrm5t3P/TjFMlkeULDS2xozEiHZ4CXkUIPUS8nMvzyCP6BpaSP/YJVy6nS/NR
         RT4nD+Ve2ftWudlHjCXt/7bEzbtSYFUh1DWr9PZjCFNC9HcHiJuurvHLdnKvrgxzkLlh
         cW23kHyJXGkP/Q7PqUrHVhJhmbxXJTJ67ByRcStPjNrWf/5JDD+fZhou+zM3n58hleYa
         ft3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781134987; x=1781739787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=an0SgUn1oFV1bun03BprU1b2Uy0096MbOZfVjaHKMKY=;
        b=denIQF7oc6ira0KntkORXYF7nTkmIu8b9q47qvHuNsTKAcFCUfXgOBC72jeSJBAJJK
         e/7UGIC9d6pP88gOyqg6QKB03f+pfHRsPL45NM7Vjq5MGgYbVVKSepLQTKR1uct9x9th
         rfUtF0M5m2hUrPkL/bFrj7ai41CcMd3IjsbzRGd+RGVoVRiaz6X5QkmE9cJb0Fqe/aAG
         wZ6SH+iW0NneCZth5kQxSxpf5xfreplxTInYf+RGqUg8fU9JvNcJZG1y86xUEMBEY/xr
         pFNPb9Qyke040TRZdk2TluQ0Phe8qLeRuG+GbSepJh/whT8hVR/lGRkODSJQfhn5Ge/N
         MkUA==
X-Forwarded-Encrypted: i=1; AFNElJ/1KFCwy0xeb3ibBLsmYWs5kaXLtvB6qg1se5hIF4T5csXfajON16S0P2KFoTXzoP13KPuWCFDLa/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDnMfqEVnbiRIj48u2JdiU2VQXiHkumsIGaG6g3d5IaTHZ5HLk
	SYDKQhaaJnBHrY9/sC/9zmMisjvWl3pyIkpP06tIBNT4A1CSNwXdH/Fh
X-Gm-Gg: Acq92OEiiCiLSgNtuW6oi/B/fEnCMz3nb0INaMuL4HHWfryenSeyrm+w+4Ufgt9QuW6
	w4cNZP0T350hPwfcU8GqhN6lqLS8gAfAmvPmzuG8+5E0REcRBC9GYdqw0YAdo0fQnaDsBnbQXU7
	10tQV1SZV8sJGeGx883TJO8osNaNrmcYSB35BMD69S9zOuN7PC34JGILRWVzvfy3eSecYJSynzj
	HpWv4wa5DstGkaDa48X0WGYe0KWoAgMQrgiv7hzy/N8MJXeZIeBJUOQCHmUDL/UNI6PQvVIf+hM
	kDgUJALFfFeeBARS2ujcn7bHsfA8Y13eARr0PD2IWwnyQMjTGOdpKyfuOsgF5TSun6meI6213lv
	tQ6aqCtVemYXbRf9uI/H1E9Uc05rqvjqsii+V+tbjA/G8/nVReyTMNF+/pumbiZh27Ka+xiiUxU
	MqJQ87MMmBBsNti/+vAeVFbl0=
X-Received: by 2002:a17:90b:5708:b0:362:e826:cefe with SMTP id 98e67ed59e1d1-377a9194d84mr388890a91.23.1781134987030;
        Wed, 10 Jun 2026 16:43:07 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-377522a1a9esm495657a91.4.2026.06.10.16.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 16:43:06 -0700 (PDT)
Date: Wed, 10 Jun 2026 16:42:59 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, corbet@lwn.net, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, skhan@linuxfoundation.org, ast@kernel.org, 
	daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com, sdf@fomichev.me
Subject: Re: [PATCH net-next 1/3] docs: net: fix minor issues with XDP
 metadata docs
Message-ID: <ain2fMNX27Z-ZlzT@devvm7509.cco0.facebook.com>
References: <20260609201224.1191391-1-kuba@kernel.org>
 <20260609201224.1191391-2-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609201224.1191391-2-kuba@kernel.org>

On 06/09, Jakub Kicinski wrote:
> Minor updates to the XDP metadata documentation:
> - s/union/struct/ for xsk_tx_metadata
> - document nested request and completion metadata fields
> - point capability queries at the xsk-features attribute
> - fix grammar in the XDP RX metadata guide
> - typos
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: corbet@lwn.net
> CC: skhan@linuxfoundation.org
> CC: ast@kernel.org
> CC: daniel@iogearbox.net
> CC: hawk@kernel.org
> CC: john.fastabend@gmail.com
> CC: sdf@fomichev.me
> CC: linux-doc@vger.kernel.org
> CC: bpf@vger.kernel.org

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
