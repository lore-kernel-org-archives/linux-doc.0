Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CAF59169
	for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 10:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706610162; cv=none; b=VtFxpCgrMYSjVaUi6bwRvM1togbaTaMQnwbeSBTPf1xajoK0Gd+SzeDlWMksXO7VnZVPjlNTexPyx1wXSlHydVU2vdj9beNd/HBWqH/+rIrczUSIwSbvoAaCgYC8U9snelxhsZZ3+lY8oazbhKKVNVomXyU5j6PgFxmQnKjbmPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706610162; c=relaxed/simple;
	bh=mdtdqeDO+9gFb4fQkxPp14Sgj8T0EiGaQwIVwtxxhUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fj6K04roWxUsnkZsp9E9rY7NH4oOfKrWstqzv59Znjr2faUb+qGQeUEAj2JoEDfZjGCxjhmcJdr+DtR5PWeuStVuJ2hySfOq13mRpKRu1auzjMtHO21jihax9k4x32VXJWdHqBf7s26uODeJEBSVpw2mGAvZZMuHGVFZoE1Z2zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=CL5yz3La; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="CL5yz3La"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40ef6f10b56so14421165e9.2
        for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 02:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1706610158; x=1707214958; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4kClIWEaLDDQHjaE6BzTG46IwU0oZSkUHIGO9qAVt3o=;
        b=CL5yz3Laplmvo9kbtAAgShDB2VS0ycBqYcSdYpcgTeCBB2KlTbu1PzEueGXYI7ST2/
         ZAzjknmx6C1QJvIbbEu8A2shdcnAf69CXttnGC5jZ1o1Jevi2vQkU6/aT99A6rhM1u+c
         fmS4H1x7SBmVBCxf8DErRYcevrIqIAlc4wXgdqLBYog2F0wNs7UMmi7AaV+x6jH8uMRU
         HQiEQ3iAfIjquhvL/MLKNHcPdK7rTybO/+3WiZyu05vjhxKjZOBYGvlj0/gFNVk71AVw
         X9rLM0jdW12g9vqMOEQeMH3m51XFa/WtAPtZhLdeotSJ7HGILAX1EWBcJTMT+ZFr92zJ
         kYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706610158; x=1707214958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4kClIWEaLDDQHjaE6BzTG46IwU0oZSkUHIGO9qAVt3o=;
        b=D/vy131cX4XkQe+H1sdo23Y5yc+thjOeh2JqbHhjFi7bx/gzwVieIqxteqzOJoFDPF
         6kSWbW89BCbBo+gxAIBDmRmx5zlHDhxkIREX75gNV3S/PmRSF+ueJGlIgVA/c4sBbAiL
         VPkxPdiKGEw7q5PvkoLi2jvicDb42eKS+eGuJlozfyaXtD65u4cVFvwVkcmOenAx4IKi
         Xx3/8ZwioNziQNRKhNJbZ9pUxBth+j+B/dy/H5OVvY6HyHb+zAiG2KUh8+9ngVYFu5eb
         rczyfnpfm3v/oJaduz/+K1WdS6m/dX+AcpI5DL52X+XZ07ra4gOEUqDG0XPnPAUjbILB
         x+ew==
X-Gm-Message-State: AOJu0YwwRzljXMu+DaNT0ByqdnkrqLna2fVX4IGOpsG41q2TNYzwhyR+
	ta0BXkZOmlylHIP+drffzXQTZ/xU+vS3LYio8TTt1GQADxG0H5CefjkGeoZ6Uw8=
X-Google-Smtp-Source: AGHT+IFaElDChgvIG3OjEHK79JFKlDyINuhOo8aBuUgr0hDZIQuzSz5VPEM9HyUEnuc2nqgv9eI7UA==
X-Received: by 2002:a7b:ca55:0:b0:40e:df1c:cf0 with SMTP id m21-20020a7bca55000000b0040edf1c0cf0mr6651263wml.33.1706610157706;
        Tue, 30 Jan 2024 02:22:37 -0800 (PST)
Received: from localhost ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id co6-20020a0560000a0600b0033af4df8e1esm3173503wrb.47.2024.01.30.02.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 02:22:37 -0800 (PST)
Date: Tue, 30 Jan 2024 11:22:34 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Donald Hunter <donald.hunter@gmail.com>
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	Jacob Keller <jacob.e.keller@intel.com>,
	Breno Leitao <leitao@debian.org>,
	Alessandro Marcolini <alessandromarcolini99@gmail.com>,
	donald.hunter@redhat.com
Subject: Re: [PATCH net-next v2 00/13] tools/net/ynl: Add features for tc
 family
Message-ID: <ZbjN6oRIZi7BfDDZ@nanopsycho>
References: <20240129223458.52046-1-donald.hunter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129223458.52046-1-donald.hunter@gmail.com>

Mon, Jan 29, 2024 at 11:34:45PM CET, donald.hunter@gmail.com wrote:
>Add features to ynl for tc and update the tc spec to use them.
>
>Patch 1 adds an option to output json instead of python pretty printing.
>Patch 2, 3 adds support and docs for sub-messages in nested attribute
>spaces that reference keys from a parent space.
>Patches 4 and 7-9 refactor ynl in support of nested struct definitions
>Patch 5 implements sub-message encoding for write ops.
>Patch 6 adds logic to set default zero values for binary blobs
>Patches 10, 11 adds support and docs for nested struct definitions
>Patch 12 updates the ynl doc generator to include type information for
>struct members.
>Patch 13 updates the tc spec - still a work in progress but more complete
>
>v1 -> v2
> - Use spec-led sub-message selector resolution instead of ChainMap
> - Add docs for sub-message selector resolution
> - Remove unused variable declaration in ynl-gen-rst
>
>Donald Hunter (13):
>  tools/net/ynl: Add --output-json arg to ynl cli
>  tools/net/ynl: Support sub-messages in nested attribute spaces
>  doc/netlink: Describe sub-message selector resolution
>  tools/net/ynl: Refactor fixed header encoding into separate method
>  tools/net/ynl: Add support for encoding sub-messages
>  tools/net/ynl: Encode default values for binary blobs
>  tools/net/ynl: Combine struct decoding logic in ynl
>  tools/net/ynl: Rename _fixed_header_size() to _struct_size()
>  tools/net/ynl: Move formatted_string method out of NlAttr
>  tools/net/ynl: Add support for nested structs
>  doc/netlink: Describe nested structs in netlink raw docs
>  tools/net/ynl: Add type info to struct members in generated docs
>  doc/netlink/specs: Update the tc spec

Looks good to me in general. I didn't review all the spec changes in
details though. FWIW:

Reviewed-by: Jiri Pirko <jiri@nvidia.com>

