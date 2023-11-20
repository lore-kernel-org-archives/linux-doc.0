Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B019A3032E;
	Mon, 20 Nov 2023 21:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DrHmb5wf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C41E9C433C8;
	Mon, 20 Nov 2023 21:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700514866;
	bh=487b6FPg1xIDbQ/pxGNTb0FaznMLNOH9vYL7GyLQj/Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DrHmb5wfqN3Pyv3DZTA9D7EOZFwsXaWEIYQisXe4v8zskMyB23kwACppmYc+TowL4
	 +5W+RGy0YZ4l5KYY74eChIm8T6nPU6wavkenXC3V1MhqO5l7TZazKiqGKAgMBaRFxE
	 URVHqwpigvtwwoMaHsFiZiVOaUxRtl7VS7wW0W/YfueSAR+dd63U4ltDl+GUlfQ12c
	 xRl0Z6mni2E2WLMJJNYvCJ4KRCP6hZDsjLzLWo6mqExsVnbRjQ8V+bZ2oVQjEXy+oZ
	 SNPrNwJ0WdGuyGVy8A1P6WXojPOrWkb6wq9lWdgtDWCwpQYHXUw4068dUjf+YCpPun
	 pkDsx/FzpTLVQ==
Date: Mon, 20 Nov 2023 13:14:24 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: leit@meta.com, Jonathan Corbet <corbet@lwn.net>, netdev@vger.kernel.org,
 donald.hunter@gmail.com, linux-doc@vger.kernel.org, pabeni@redhat.com,
 edumazet@google.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: Document each netlink family
Message-ID: <20231120131424.18187f0e@kernel.org>
In-Reply-To: <ZVvE36Sq1LD++Eb9@gmail.com>
References: <20231113202936.242308-1-leitao@debian.org>
	<87y1ew6n4x.fsf@meer.lwn.net>
	<20231117163939.2de33e83@kernel.org>
	<ZVu5rq1SdloY41nH@gmail.com>
	<20231120120706.40766380@kernel.org>
	<ZVvE36Sq1LD++Eb9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 20 Nov 2023 12:43:11 -0800 Breno Leitao wrote:
> > %.rst: $(YNL_YAML_DIR)/%.yaml
> > 	$(YNL_TOOL) -i $< -o $@  
> 
> That is basically what it does now in the current implementation, but,
> you don't need to pass the full path and no output file, since it knows
> where to get the file and where to save it to.
> 
> If you are curious about the current python script, I've pushed it here:
> https://github.com/leitao/linux/blob/netdev_discuss/tools/net/ynl/ynl-gen-rst.py
> 
> I can easily remove the paths inside the python file and only keep it in
> the Makefile, so, we can use -i $< and -o $@.

I think switching to -i / -o with full paths and removing the paths
from the generator is worthwhile.

We'll need to call the generator for another place sooner or later.
