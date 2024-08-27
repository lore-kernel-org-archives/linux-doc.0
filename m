Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D4C1C2DD1
	for <linux-doc@vger.kernel.org>; Tue, 27 Aug 2024 13:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724765896; cv=none; b=gWA6625zEEDHgRMfPYJSgY2UU7UZmnNiDaC5KlPQ5IKDY06w7iUk87eF9RjliffLEJgZXaPGp2lodpgi+xeS9rE5tA+DQP19bCPAsNOKMs5XdpHcspLdttf18aANl+ZQjqFwkfktTWWUuxzpfIXUk6o9PqNtEJNSSbhjIR54/xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724765896; c=relaxed/simple;
	bh=ERLthtgB5hPtkdxFxq7l3sdLVXMzX7gZyoAKnGd3MU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZHZ5nhTPAclPB8Bav1Mw6DqRbzOG/qJuo8OSfENd2QP0UzaYzu2I22MzvSnmixMql+7qhcQ7VaxHqTkaQAHyeqLvF5eb4tXyP06CCHGAdYKGxopyZ7nIk0GjQDPP6Frv70KLoQrl4yMuWKphHfYgGzvs/bDtiCT0GPKoO1y72Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E200DA7
	for <linux-doc@vger.kernel.org>; Tue, 27 Aug 2024 06:38:40 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E11893F66E
	for <linux-doc@vger.kernel.org>; Tue, 27 Aug 2024 06:38:13 -0700 (PDT)
Date: Tue, 27 Aug 2024 14:38:04 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Aryabhatta Dey <aryabhattadey35@gmail.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/gpu: Fix typo in
 Documentation/gpu/komeda-kms.rst
Message-ID: <Zs3WvKCbvqCrIO0G@e110455-lin.cambridge.arm.com>
References: <l5wzytcamcc43eadaquqbrfqilq6ajfnnseh37c77eceamtw35@hhtdipi4h22c>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <l5wzytcamcc43eadaquqbrfqilq6ajfnnseh37c77eceamtw35@hhtdipi4h22c>

On Tue, Aug 27, 2024 at 06:48:52PM +0530, Aryabhatta Dey wrote:
> Change 'indenpendently' to 'independently'.
> 
> Signed-off-by: Aryabhatta Dey <aryabhattadey35@gmail.com>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Thanks for the patch!

Jonathan, is that something you can pick up in your tree?

Best regards,
Liviu

> ---
>  Documentation/gpu/komeda-kms.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/komeda-kms.rst b/Documentation/gpu/komeda-kms.rst
> index 633a016563ae..eaea40eb725b 100644
> --- a/Documentation/gpu/komeda-kms.rst
> +++ b/Documentation/gpu/komeda-kms.rst
> @@ -86,7 +86,7 @@ types of working mode:
>  -   Single display mode
>      Two pipelines work together to drive only one display output.
>  
> -    On this mode, pipeline_B doesn't work indenpendently, but outputs its
> +    On this mode, pipeline_B doesn't work independently, but outputs its
>      composition result into pipeline_A, and its pixel timing also derived from
>      pipeline_A.timing_ctrlr. The pipeline_B works just like a "slave" of
>      pipeline_A(master)
> -- 
> 2.46.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
