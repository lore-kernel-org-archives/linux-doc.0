Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D365D494;
	Tue, 12 Dec 2023 16:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jqdFB2Bx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A822DC433C7;
	Tue, 12 Dec 2023 16:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702397635;
	bh=3ZttEBbv0RMCRuUMpKRrIA7ITU+bYmAnlLTWgVGcR+o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jqdFB2BxPleWbQ6sVBGDbfg8a16QAXyRdPIP939H5tOz608h8JKCxkWTGpuo6L6LG
	 hm0O5N3sdS79UzxUQ5JjEbDoBU/dZrkTLa8vZzdryGlf1YCBBeqSwAxP7VvFqQFmMT
	 0tOBWZLdcTwi696c+9OzcIyaCyar9nDQTzj6PKdWTz7cIEMdhdoRSbBNZUcTmfZm+E
	 TEepu8ST/FYTzd1K3PR5zEwsCipW5IzdNUCwc44igBd4aqs8X3j3xayMbSedQdO3Rm
	 EAOAEAPn1YyGVUaW7ITQoA2z1KfQ1+iHRMDUhCBPLp+KjFFiRDaeeCm2b80euehviJ
	 v6EI5wOiO5oPg==
Date: Tue, 12 Dec 2023 08:13:53 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Donald Hunter <donald.hunter@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Jacob Keller
 <jacob.e.keller@intel.com>, donald.hunter@redhat.com, leitao@debian.org
Subject: Re: [PATCH net-next v2 02/11] tools/net/ynl-gen-rst: Sort the index
 of generated netlink specs
Message-ID: <20231212081353.45177018@kernel.org>
In-Reply-To: <m2cyvb8xq4.fsf@gmail.com>
References: <20231211164039.83034-1-donald.hunter@gmail.com>
	<20231211164039.83034-3-donald.hunter@gmail.com>
	<20231211153000.44421adf@kernel.org>
	<m2cyvb8xq4.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 12 Dec 2023 11:30:11 +0000 Donald Hunter wrote:
> Jakub Kicinski <kuba@kernel.org> writes:
> > On Mon, 11 Dec 2023 16:40:30 +0000 Donald Hunter wrote:  
> >> The index of netlink specs was being generated unsorted. Sort the output
> >> before generating the index entries.
> >> 
> >> Signed-off-by: Donald Hunter <donald.hunter@gmail.com>  
> >
> > Reviewed-by: Jakub Kicinski <kuba@kernel.org>
> >
> > Please do CC Breno on tools/net/ynl/ynl-gen-rst.py changes.
> > https://lore.kernel.org/all/20231211164039.83034-3-donald.hunter@gmail.com/  
> 
> Ack, will do.
> 
> Is there a streamlined way to apply output from get_maintainer.pl to
> individual patches in a series, or do I just add specific names by hand?

Some people have a CC command as a git send-email hook.
Others have scripts to insert CCs into the commits themselves.
I think there was an attempt to add a relevant code to scripts/
but I think it was rejected. You gotta look around :(
