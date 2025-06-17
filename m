Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB308524F
	for <linux-doc@vger.kernel.org>; Tue, 17 Jun 2025 00:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750119061; cv=none; b=qY9lOvScJDVRvjwSShmsf0CuZNSnHodIbd0hvUiQIOuaUpD5zhyn1XbTs1h2eFWxBUgpA2qRbD64svCuldOaz+lFtot7HpsJ9BYSuDKQfk8FAjCkf0ews2tBcQS3jdPSDjQd+Le5uMzhJyjMuFOZz17gvthZziaSSytY5WHanks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750119061; c=relaxed/simple;
	bh=cW9a3H2Jb1XORPCWPEbQXH89DofL90Y/4tlpYncP5Rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GtrqnjHIRq+wX8nSVdez7aMkFyF8M1+wHoJHZfwvadjRsBcfPiNjsQLZ66+zbx/5tJBmmYlyWfFgP4SMhUMFu6/9iKiL4xezeqMfC3YHFicpQCCkAT5hXIep6aNHGWdbjZ0nmScqdZKJDEMuWvGmhDLVqNVnrZuXOAHZY7ieqHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=RDXXWZ+K; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="RDXXWZ+K"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7d21cecc11fso981500885a.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Jun 2025 17:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1750119057; x=1750723857; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e5TEqGP1dA1ohDNNPEUIn+95Q5c5y2M6lr7dUEc7k9U=;
        b=RDXXWZ+KwE2+4LSb7ctQH5GYfTiJoYS6MiwgxmT33G10W7tEFaFSkcd388+pg4rE4m
         xiWaBLGZsRGBy14UTyouhU1t7kOqj5KzaKH5QtRLu7CvEhD5+xMqTI9JkeV+kSHVZnRI
         43zoXRjbeXo5ciWP1X2gX70UdSjz4+Mwt5dJfkVvdmyxTF9BYIa5V19n+HLUlgIVKKAs
         XdGL6/eivkNxEeQIpc42ogywATi2GYvM0WYVTdXboz6LcCGTmvg52KaSDHq0+5/YXDPF
         Xxl1ek6rJbsL8DnDnVSa9mlUpKhY30ZqGyqRCkzGgnG2opZDOYn17cpHe0T2Fhd1ek09
         F/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750119057; x=1750723857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5TEqGP1dA1ohDNNPEUIn+95Q5c5y2M6lr7dUEc7k9U=;
        b=YZL1UHjcMCyX1uodYlZVwa6PuFonsmxeA/mk7iKOCwEIAidjOosN8izCjJFGc+Ftvo
         xSJfwfHBxpp/eUGQWAskQB9jpb0H3r46/2K1UhkjKtNzF9t3ZnAIKX7AMOXOqfgtvPQc
         Ps/MDXP4ovVhtVaEu0zLCpTRlF+LyXcia8PB1fB8DaOhaxixeATqU09uZYmVP2WNx7fW
         6WPcbRgy1l1JWr8+Dd3JzWUA5gJDyT4JmjHeGWsCGFQR87oLWLW5Nk+kuoZeArcK3au2
         yiAw37ZWCUpxBDMCGbz7CEi9W3IR9vaa3X1hsiFiBRwa9UoLxYfuz6gnwwnw4L/hJC8m
         sYmg==
X-Forwarded-Encrypted: i=1; AJvYcCVtADKg9CSPqBiMBtJOTU/HHJ5wfM714FBd3BpTCyQijdjmHTxXcmiufWXxVE4SeTx8/TrBY8Buf5w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSz1YsZCXo3Go8cFVYDYPbUH0n8at9gDZXFvPptsfPKfRuyN6Q
	bpCtKNiQkVth8ocg3QvPEKAjPSLlpzZzqK2epcCfUTbDWoYV7ny5znJMdnUoGTJv9vU=
X-Gm-Gg: ASbGncv3dJin+hIl7AuPDw5lqu49ASW0qGYM1FhSJR4zdHBjeE9ZwNxY/GdVo/2etnX
	JB6d4yiz16Lk7N0m/IANuNGVR0+4RgecVKZDgFUUbqe98ndN7QoaBKMisGOgyp0FgyXRhIcq/Qd
	etD3MqFWeoLEoMyU8npujQ+9n9WSe42rEbkXHEaSYTDifd+LnQJihvAm5NaEe57KkNi5p6Yn1/B
	LjceSxOAl9TKNNdk3tZI1n69RItGh82ecfANp25dE2UJyFRnhBbHhykjoPzyQFDR8z6EykiNRsg
	TQokIY1RLMo3pbyRMLu9iKTKBc6NosnQbDngOZXbKVFMjJs0evrlqSuFkA==
X-Google-Smtp-Source: AGHT+IETz9LYg5ng7mTZU0WsBXmtI5+6OhKkrzdiTTp9Ts5WqaC5ydvNWoYbhaOUC9it+gTF/lSbLw==
X-Received: by 2002:a05:622a:87:b0:4a4:3bae:8dce with SMTP id d75a77b69052e-4a73c597286mr190961541cf.33.1750119057584;
        Mon, 16 Jun 2025 17:10:57 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c091:400::5:cf64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a3103a5sm54775971cf.30.2025.06.16.17.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 17:10:56 -0700 (PDT)
Date: Mon, 16 Jun 2025 19:10:54 -0500
From: Gregory Price <gourry@gourry.net>
To: Dave Jiang <dave.jiang@intel.com>
Cc: Alok Tiwari <alok.a.tiwari@oracle.com>, linux-doc@vger.kernel.org,
	linux-cxl@vger.kernel.org, corbet@lwn.net, dave@stgolabs.net,
	jonathan.cameron@huawei.com, alison.schofield@intel.com,
	vishal.l.verma@intel.com, ira.weiny@intel.com,
	dan.j.williams@intel.com, linux-kernel@vger.kernel.org,
	darren.kenny@oracle.com
Subject: Re: [PATCH] cxl: docs/devices Fix typos and clarify wording in
 device-types.rst
Message-ID: <aFCyjkSB9VwZXjPt@gourry-fedora-PF4VCD3F>
References: <20250616060737.1645393-1-alok.a.tiwari@oracle.com>
 <aFBUGTM4fpwU749k@gourry-fedora-PF4VCD3F>
 <b2acd80e-38ce-488f-a6d8-8bdad425534c@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2acd80e-38ce-488f-a6d8-8bdad425534c@intel.com>

On Mon, Jun 16, 2025 at 03:32:44PM -0700, Dave Jiang wrote:
> > With that change you may add
> > 
> > Reviewed-by: Gregory Price <gourry@gourry.net>
> 
> I fixed it up with your suggestion and applied to cxl/next. Please check and make sure the fix is correct. Thanks!

lgtm
