Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7663C35BDAA
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 16:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766073792; cv=none; b=k1hkq4pcqy2eGNisvctSvQ0IdBS2BAX4MVA4hYjlT9jHfKyAQZchBafVBjcltOfJrUoByzo0v1srlT98Nd2g9Yz8ldon14KlzM1FBhUFqvEx0QyPtXF6IhK1JuHAgH1ABIYXTIOQuquCATcBkocFJWzhd5cZUpRjJ4UyrAEE6JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766073792; c=relaxed/simple;
	bh=A4mOb32DmKiWyyK2JPZxylZSPeHcE8/kb9hf2Y3YuKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WD8OczunD9173AA4i/Cri/Efxob+em7gbWzu6ExAK2msqjIE/gna6H7TX3eItIa43Y5zZ4CGvymHXHASlNCyCFMkcfDvQ/oS1VppxCSuWOGUgMVxsduz2j9VOWZSVygheQmNpOuTxb/2uqqf9XAJPsit4/I0VOslnQQlVFCJpqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ZscNO0/I; arc=none smtp.client-ip=209.85.222.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="ZscNO0/I"
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-8b9f73728e8so81509185a.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 08:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1766073789; x=1766678589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7IzVxaTf0jaeuMwPm/a733fCCxbrEOa5y1/tCVws3Fc=;
        b=ZscNO0/IVAuJjtwUwHxx0Uk5FmsUWju4YpPBccTe7EvT/R3gbHeNMTfuaKSD5s8djI
         wnmRAidKR6AuFmv90zBaFqD3+pRmx9BovR0rwBZT/bB846yD6bqBXpsqWPnnrV/KaUV/
         4HVNUl4IZ71z2n175LeAKb/dHT8dQ0lxfNADzSohCg/zeqHyOGYkQvK+n+WuaVmlSVKQ
         RNpap8P1Jg3VvOGkoFxGZYiYtXV6hI/2t9gApbWtA++iC0VDeH7KGI6bswXO/vUfNJUg
         RSYJL9xGIeqAx3P9amNodfW4ASqoCw26+v/nXDaVQ9JydKDNnsriaHd8+dVmDVEiJAk9
         f/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766073789; x=1766678589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7IzVxaTf0jaeuMwPm/a733fCCxbrEOa5y1/tCVws3Fc=;
        b=rQmkUne8skoWT5tsJcMWGEFZ1BDRavR/QNjUGlvoeYi7aGknfNXmC/avaMwCPO/oe3
         UFl4173d7/JCmsgaPjKOqi0U4EfmCSrLEmuFEF7cBvWNBleMb+QGoFtggx8Y42tkZRnZ
         npB0FeocsiM+p/aucyjI0Rp44x5+qoyBOUo9OBvDL7LvAJ7uq1IvUW8eKf3H4mnyLXws
         kWof8ac9KBUFMtvwqyXtIEQjuk9G88N8ODkjP0dJY/jxIk1PB32RDv6pOuDYHUU7mdi+
         lBlncRDcH4/OG1FK6hrX394YViJPU09l1JXE3S7Pq5kabgagz95YoVreFL8xFMTMXEgR
         W1fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhKf0+r07V7jEq0xAsWNmfp1SCCaWgGAgUhmb4MlDIRJbugohy4TNIC0R/vMrdaM/S8TSvul8T6cs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBwPX2GXOrWNk1CIX92n/IDwuJV6WiXGk0GXgIaO0cu1kk1qo6
	1BimIbPe343LfPfo3C/eLKrubQrb0caF5KjwKJ3q3U8vGsTl+L34pQ4d69GP8UImHUE=
X-Gm-Gg: AY/fxX7RR8HoHSvQLIqHleIaKPbqkhDKun+nNnXdOIwPrm4VssnLU2TgYG2THXJW9gy
	y9vO0D2LcBEAiDDuCn2Qs5r/SGamN2SCs+Qk5geB1/1fIn39PlYAkF3btGpr2IktrhXgXKikgLy
	qX0u0J9oDzQ0zoBn0iAHF7N1iU7+Fv+5wQPxkwU8QWtgvF9fNXzEo9jJKAnB0OZh5SrUjo4LbxG
	O08qO4Sni01OiUQ2LEuXUWdcUZIR/g60QcVBl1mVxbDOcJdNjkEaIrjxkIjHFFqAj3moeGWMtN2
	TR+Uwyz/xGAWtryXftYACNE/Z1LfKB5qz7t4RMtYBF9dXDsCNFgqV4U4zHyBoxjYwFcUpvzW+KJ
	yBtAf+ksZRZ/KfQe0XUWekAziMVIENaW80EMhwmN0y7kfMVTFS50WRwwqDDTt2gvijDC/OIrtir
	O9vsUnjL3yvMgGJXmwEZY4h6m2gX4M8E4VS5r6SEh0IiKtFKP+qe9q0Me8oaG3+T8lVwulyA==
X-Google-Smtp-Source: AGHT+IG1yQ5C57G8nRuFeVcBRmQS87uemrTm176NKjxY5iYVHiQoNYoa5U9KzCj4h1JrNIJZYFwGvA==
X-Received: by 2002:a05:620a:4483:b0:8b2:7290:27f6 with SMTP id af79cd13be357-8c08fac0c29mr16601885a.67.1766073789038;
        Thu, 18 Dec 2025 08:03:09 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8beeb5d115fsm197027285a.5.2025.12.18.08.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 08:03:08 -0800 (PST)
Date: Thu, 18 Dec 2025 11:02:30 -0500
From: Gregory Price <gourry@gourry.net>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, dave@stgolabs.net,
	dave.jiang@intel.com, alison.schofield@intel.com,
	vishal.l.verma@intel.com, ira.weiny@intel.com,
	dan.j.williams@intel.com, corbet@lwn.net, kernel-team@meta.com,
	alejandro.lucero-palau@amd.com
Subject: Re: [PATCH] Documentation/driver-api/cxl: device hotplug section
Message-ID: <aUQllpH-4c2pGugv@gourry-fedora-PF4VCD3F>
References: <20251218144636.1232527-1-gourry@gourry.net>
 <20251218152616.00005b73@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218152616.00005b73@huawei.com>

On Thu, Dec 18, 2025 at 03:26:16PM +0000, Jonathan Cameron wrote:
> On Thu, 18 Dec 2025 09:46:36 -0500
> Gregory Price <gourry@gourry.net> wrote:
> 
> > Describe cxl memory device hotplug implications, in particular how the
> > platform CEDT CFMWS must be described to support successful hot-add of
> > memory devices.
> > 
> > Signed-off-by: Gregory Price <gourry@gourry.net>
> 
> Hi Gregory,
> 
> Thanks for drawing this up.

ack on most of your notes, discussion on platform/switch stuff

> > +CEDT CFMWS region with sufficient memory capacity to cover all future
> > +potentially added capacity.
> > +
> > +Switches in the fabric should report the max possible memory capacity
> > +expected to be hot-added so that platform software may construct the
> > +appropriately sized CFMWS.
> 
> How do switches report this? I don't think they can as it really has nothing
> to do with the switch beyond maybe how many DSPs it has (which incidentally
> is what is used to work out space for PCI HP where the code divides up space
> left over space between HP DSPs.).
> 
> Obviously this excludes the weird switches that are out there than pretend
> to be a single memory device as those are not switches at all as far
> as Linux is concerned.
> 

Good point - in reality, it probably should say something like:

```
A hot-plug capable CXL memory device should report the maximum possible
capacity for the device in the CEDT CFMWS, rather than the CFMWS memory
region to the capacity present at boot time.

To support memory device hotplug directly on the host bridge (or on a
switch downstream of a HB without built-in memory device capabilities),
a platform must construct a CEDT CFMWS at boot with sufficient resources
to support the max possible (or expected) hotplug memory capacity.
```

In one case, an attached device which supports hotplug (which somewhat
implies a switch is present), is responsible for presenting the platform
the resources.  In theory, at least, a platform doesn't need to do
anything here if the device vendor has set things up correctly.

In the second case, the platform is responsible for making that decision,
at it's on the ODM+CPU manufacturers to make sufficient BIOS/EFI/etc
options available to support this kind of pre-allocation lacking any
attached device at boot.  (not sure whether i should add this explicitly
above).

> > +Platform vendors should work with switch vendors to work out how this
> > +HPA space reservation should work when one or more interleave options are
> > +intended to be presented to a host.
> 
> Same as above. Nothing to do with switches as far as I understand things
> beyond them providing fan out. So if you have
>        HB0          HB1
>     RP0 RP1         RP2
>      |   |           | 
>    Empty Empty      USP
>               _______|_______
>              |    |   |     |
>             DSP  DSP  DSP   DSP
>              |    |   |     |
>                 All empty
> 
> You might provide more room for devices below HB1 than HB0 if you don't expect
> to see switches being hot added.
> 

Same note from above

also *yoink* your ascii :]

~Gregory
