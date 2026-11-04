Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815591;
	b=RsgdO8a7MwHXa2cE8wtD6jQfX7XA/OMyw1Bq2MSAeC6prJ5mrZU/ihmOE0NbRUPkJ0IE
	 BEvv0tNz0cF2sTS34G+Us0TmzMB+kBV7kCrhFFoMZbZPCgABSJhUlGLt3EPC3g2LVcV/J
	 +WVOaotpFSCGFweFx5pXHhwYdRZ7phNR1rf+6nGi2CW6ctTocqjxkHBYsuZLtHkq5vMFT
	 mulm1Uq/49NBIpiu1UMp8Bona+fr20jwatvSmyjJVWdUfuk08scFOdbTLo6OjI09CsqHR
	 UAvsXvT6CY9FHNtakn/WA1wrgtHsUh8nPDcd+fGFkZQjNJM2PBQjeEzxymGI9grrDMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GRG5s9Ykm6gdotG16z6YfBmoncjsZwUpCfdfDleiz1Q=;
	b=kwh6ChWULea6Eaayolm8mGsZ1+xAxU4AxsSRHCQcR1OPB2ALPax0yhURgkjnTxXwc8z8
	 siN0liIpN+5KjIJzJGeT6WoqHCa27Ntg0fdHU7QBjEU0DIU305bkDzAo/ZLKR0kNz+ZZH
	 F9tdpfmkTtP2DUaEcKZRqTxk4DOjpnz5BqY85eSb1SzR5nwb3JhQGokQeuUlkyNzu6pl9
	 xH0WZm0iwtDIRiTY/yfsuugzCFSVStt2FqcP2EOEuTEdwxDF2KPzrfI4jQvuMyI3iLnkJ
	 wa2xWuU736pzfMjouOgarL37wIUxSzzPU/u0vNLH5Zy0/YdUiFp12ahBxrPIccpCjfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF87606D80B
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 18:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAF87606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso476482a12.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 10:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793815590; x=1794420390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GRG5s9Ykm6gdotG16z6YfBmoncjsZwUpCfdfDleiz1Q=;
        b=WliIYQRYHNdchsLq7SQIkvo/eS23FuBDujIvZwfiAhbl1fJdFHV3CQ3WnIHjP0/A8X
         RC+UZxPyOIZJwQi8Q1/saKu1y5dPGuUmaxotbeWEjNu+dZGDNJYHzYIf1c4SCLBP/BhQ
         C/k6PeRYrCFEMtB6+YicL2zlEPPWKalYa/voigHvz9GObPPZei1JLW1Jos3kRtmRe4Jy
         IQqXUYnJ37WC+ljY9DquIcjkKt7VD6xGb0Z5UzdaZr0vy2jkaqwbvP9EM0kBLl04JHK4
         lhCi4WxBcwkiLLvTqKtokv9DoGjU+IIvUPHJSDnco6EMxQjmST+K+yaVMjlLPxA5uvWb
         jF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815590; x=1794420390;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GRG5s9Ykm6gdotG16z6YfBmoncjsZwUpCfdfDleiz1Q=;
        b=Ne4EeMRjYZlLbPsAjzodeHHSEeMzC/ccElG+c8PVg+aOq6MurlDYVVEVUrzscIAUH3
         6tzzR5z2KBz/yWDbnzvy8P/HReD/SGAnX1pquYXz0TKSCB0b4ZY/aijiTPbBbkZBhwVw
         dSgADwtq+etfq9wD4j7i3N0ZQhfqGbD6JpsPCA01OwmgrjuAsJd2kuUIY3BxNHSQ93sF
         xv+aeuo6N3ytgr2aErHJZGfb4FW2x0Wzgr6/FUynbTP9O+yF7lFQhwGUZkI0rRLcdk6a
         TM8Y0+PBUwi92803ORxhBZEEpHS0JoWol9PmVjKqZC7VTTNhVozh07HkUwjaUy5OeGtD
         f/YQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJ9n5kt4sfd6G7TnUCgpyZJWBXrxbkihfTqO1qOMD2TVlOaRxL6Z4+wBOvHZRuCjUzLd3lyKX4L1U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Onkg5voYuI03DAqFnZdBDuOU8UaHgafJiRAe62qOAFW+S8P32
	thFyJ8YIdOQBBxVKgF6ZYKLMisymKBAJ4XpDMS35viBUsl2JcUPFXTtfJN/aljDJzw==
X-Gm-Gg: AYBFou1Kj3SaFEH1x0Kaikikpi9i9CqUSejOn/B8sVVjHgpn6lhayilJSCTKgt5W3dE
	ZZRavRVqsj01scbpG1IuIbBZPJHq4iOyFD4qREdQbgMNN5+bmy7f6LS5gIOi4DWNOZ8OgkLFwY1
	egfLOYC0M4fXAKiXhaDIE7sKndRJs/AjT+A/zIKwZsIssN4qpAU5pfTrO1lBuaI8DZy8cIcki+d
	4WJJP8yTBjXEvCS+phI+/XLoUR6OtmIA+mH6z9c64hjs6Bb4uaPY9l0oNw77nzRasv65poNzJ0A
	n1MJRL3+3LEpI5HbrGIx28iJY5nQNdZy7BNDsOn8Iatk1w0wrgBhNoytk+ZIOtyJpZjIo9U2J7F
	HAv74l7PL4FEr6GAqJv57ohQTOy5zpghDICkkjtk5Defmwn91CAEGzHdY945iGnU3lmWMSDnQR8
	PDWwlghweq+KGQ5UGeLopl1jWKD/R8SX51capsHxo/U4iE/9cKxdYED3TtC0lLrSyVDN13PYWZ/
	9p+NnGEbiCOHpqBWJ4wSg9z9oT/cek39cFZk8QBoRQkl+CrdfsyejTEdkIeODLTULTkgCMyFsgr
	P/DVHaLgT31ANupGfAvXOUX4d7hA2Fod1Q/QzICLzXc9HI7GcxKbhSF5G+p8cExV
X-Received: by 2002:a17:90b:180d:b0:3a4:8c41:fab6 with SMTP id 98e67ed59e1d1-3ae8983f058mr13975312a91.46.1793815589132;
        Wed, 04 Nov 2026 10:06:29 -0800 (PST)
Received: from google.com (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb4694a0e0sm1481545a12.20.2026.11.04.10.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:06:27 -0800 (PST)
Date: Wed, 4 Nov 2026 18:06:23 +0000
From: David Matlack <dmatlack@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, kexec@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>,
	Alex Williamson <alex@shazbot.org>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Josh Hilke <jrhilke@google.com>,
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v10 00/13] PCI: liveupdate: PCI core support for Live
 Update
Message-ID: <aut0H65XKAHUqPR9@google.com>
References: <20261013162529.1928093-1-dmatlack@google.com>
 <autxCZPJ9yiE2ucq@google.com>
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
In-Reply-To: <autxCZPJ9yiE2ucq@google.com>

On 2026-11-04 01:00 PM, Pasha Tatashin wrote:
> On 10-13 16:25, David Matlack wrote:
> > v10:
> >  - Save and restore the ACS Egress Control Vector along with the ACS
> >    Control register, sizing the save buffer from the HwInit Egress
> >    Control Vector Size field (Alex) and drop Bjorn's R-b tag
> >  - Make CONFIG_PCI_LIVEUPDATE depend on 64BIT from the first patch
> >    rather than adding the dependency later in the series (Pratyush,
> >    Mike)
> >  - Reword kernel-doc comments to read better in the HTML docs and
> >    spell out "reference count" (Mike)
> >  - Replace the version number at the start of struct pci_ser with
> >    required_flags and optional_flags, and record the size of struct
> >    pci_dev_ser, so that the PCI FLB ABI can be extended (LPC BoF)
> 
> Hi Bjorn,
> 
> I am planning to target this series for the 7.5 merge window through the 
> liveupdate tree, as we previously agreed. However, there are still 6 
> patches that lack an Acked-by from you. I believe you might have 
> reviewed some of them before, but the tags were lost during subsequent 
> refactoring. Could you please take another look at the following to make 
> sure everything is in order for us to merge the series:
> 
> PCI: liveupdate: Set up FLB handler for the PCI core
> PCI: liveupdate: Track incoming preserved PCI devices
> PCI: liveupdate: Document driver binding responsibilities
> PCI: liveupdate: Auto-preserve upstream bridges across Live Update
> PCI: Save and restore the ACS Control register and Egress Control Vector
> PCI: liveupdate: Adopt ACS controls in incoming preserved devices

Thanks Pasha. One more for Bjorn's list:

  [06/13] PCI: liveupdate: Preserve bus numbers during Live Update
          https://lore.kernel.org/linux-pci/20261013162529.1928093-7-dmatlack@google.com/

Bjorn's Reviewed-by on it was dropped in v9 when it changed materially
(albeit based on his feedback).

Alex, could you also take a look at the two ACS patches? 08 includes the
Egress Control Vector save/restore you asked for in v9.

  [08/13] PCI: Save and restore the ACS Control register and Egress Control Vector
          https://lore.kernel.org/linux-pci/20261013162529.1928093-9-dmatlack@google.com/
  [09/13] PCI: liveupdate: Adopt ACS controls in incoming preserved devices
          https://lore.kernel.org/linux-pci/20261013162529.1928093-10-dmatlack@google.com/
