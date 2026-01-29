Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A9B2EE268
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 21:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769721480; cv=none; b=Yda65YKEV28PrjPiJ9+x/ihrOhaesAFiUD5YOHhYjyNqpEaJdIKdlNkM7yoZ2AivAO/QZV5DQd6W8mswt/WAc2Dx9a89/6h+P14as2bkdRLTQe/kfqOMiovjnSo+uK3UcO4LxgIPfDnlOZ0z+kjyxcMxdfuFvmOO6L5+XZoNXDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769721480; c=relaxed/simple;
	bh=l9xIkbZKM30zA9x2QI+alFDGiuf8CP4pmINW3Kx7q0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mNIWJx1IIht02bkrwPLfmThNae1gXhC/HKEjkRiHQDj7QE3z2hvwFH+koslZca3ty9APfABOmuz1x4YfQpCnawy/VVSvJl/6n0eQLPQPAse+Xt1iZx4HXWem6PySnj+o/hcl/cPqdPk7LRoBKD2dOQszVIxwPNWyI8ApnG58OTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=OzrkhGqF; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="OzrkhGqF"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8946a794e4fso16776256d6.2
        for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 13:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1769721478; x=1770326278; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l9xIkbZKM30zA9x2QI+alFDGiuf8CP4pmINW3Kx7q0w=;
        b=OzrkhGqFaNFbcrvM7g0osWSQziuBpkIMijxxE5yuoXwUH64v1YQlRXRpS4eR2V0NB3
         ETTgSrHxAniIfkIxxbqhavTtU8tj/CtKW7XGIyj7D5LLXC9z2jnd4bqwlLPSgCQpE28e
         xU+6NkggMaN3OvjPjHZTJgUzqufnDxxVGbz5XHcOEGi42kC2RohF6tEdciVlPLrcQYDJ
         qRjmqKDReOX6bFYn0vuCpxjbLuXYMh6t4FTZmLyCyDINc2awm++RFe0yLaIr14NifjVT
         2Q5jS+FdjZTa5AJB7iuz4gE7DA/2hZhyMgmJbM4jEx7pwU/h0HbokNyOVZ1yKKZEo87w
         Qu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769721478; x=1770326278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9xIkbZKM30zA9x2QI+alFDGiuf8CP4pmINW3Kx7q0w=;
        b=BrXhX2dBAKLD05ZSMXLrgal39o+I4356kDsVQF9iSKP5Gjcxo2AN5Trhy9Y9QiRNlP
         Gu9r9unIa24GEPhcLA2f6365Ag4iBfhi2ZrsqyNY+va8/ztvIzl2eYdqhPc9721mVS9u
         f/mp37ZrwMEnjEtbvCps4drXeJo8cIvVrGGngBenKmByRhYPLBrZJvdOjVHPw6PFx2jb
         tQgZvJAPuXZ9p9CIdtMcwYSXxogaGW5F3bIdSUa4CAD8yWx1RH3aj9N0g5Ws2f6/+oYn
         s8Pm0n6reLaX0IsfwhRcXtfe7Rcefv/cvEEy5a0xVe4DXmL3ebFLbXagfZcinbyJP/QY
         ArqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtGU918PAcpXeWE/SstnfwlnCnN5ukCYVmfnL4ZMoPHRnCK9YkNGyJ0xnAxJzaxsdSMUfVLV7IkpM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4fJgVmhwlM53YmSKQvokKIeBbV892Tdb6lX717IPVUrY+uIZw
	8tJsUo7XSDldTigTO7aRo4+A9xj/ffyaMYkBIQOngWQud/qQ0wTxHkvyhvm1DJLnPtM=
X-Gm-Gg: AZuq6aJLoDquvEwqak6y7T6ELFhLhY/E5lFkoWwZSKaLGKSo8YrqcWQiLx4QdJbs6vT
	7+SfVlYSZYGpNR8/Q+mwmw6TBEp873dwNWAtaoRo7l95lqgAT0L9+FxELZUHx9b1oztZ9pBAM0l
	dN8T3DyJg53k5R1q0bu51jwlo0MvWk/VaJDDuuRCROGCc9BYMjeLvl6pL7aC4agjH+iRE/HYA0i
	m8TOx/mLjMJy/Z+i23osbWo6XJVumqgSuWLhZaec/7T74/Shw1CkPQ6WBjl8pPmk0bGyD7RNzaP
	w9Rj+8gx6ewovqFvtvLGE7MlOTNlTiRc1h68rqNRfQcEkaIn+0SiJyOkZ9ErPXnuvsdh0rO0xpf
	JKlCyIQpTG9AKzrZdq+NphfDIdTEaG5YiLAwcADsdyF3ZHq0b6YdDYVUqOYfaEJZ8fmyoFpSLzh
	wbYkrpjL3xa+iUEL3TZbAZyhm2JHHphinkrSjBUQ+0Q6w+WSf6RNdheVEGfSBmQMPpFAhJyg==
X-Received: by 2002:a05:6214:401d:b0:894:71c0:6fc with SMTP id 6a1803df08f44-894ea1170b8mr13110576d6.57.1769721477709;
        Thu, 29 Jan 2026 13:17:57 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d36a5ca2sm44936276d6.7.2026.01.29.13.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 13:17:57 -0800 (PST)
Date: Thu, 29 Jan 2026 16:17:55 -0500
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-cxl@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kernel-team@meta.com, dave@stgolabs.net,
	jonathan.cameron@huawei.com, dave.jiang@intel.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	ira.weiny@intel.com, dan.j.williams@intel.com, willy@infradead.org,
	jack@suse.cz, terry.bowman@amd.com, john@jagalactic.com
Subject: Re: [PATCH 0/9] cxl: explicit DAX driver selection and hotplug
Message-ID: <aXvOgw2rc8X7Cqxa@gourry-fedora-PF4VCD3F>
References: <20260129210442.3951412-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129210442.3951412-1-gourry@gourry.net>


Annoyingly, my email client has been truncating my titles:

cxl: explicit DAX driver selection and hotplug policy for CXL regions

~Gregory
