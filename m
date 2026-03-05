Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEF53793B8;
	Thu,  5 Mar 2026 15:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772724748; cv=none; b=NeUvRcQdQTLjelzSdMjLK0cR766eHbfjqKW3XO/343wnNb+Rti9KtJW+2cbyvalXV7sg6HBTWUlrHyljREpTOx37mdoqEaEwGhDLAj2L6KcsFBKYe8GvE8MuE3JGoQTvrJSl1ndO2mOYr9htq8gnz1AMr97vTgFht3qqqbqvFTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772724748; c=relaxed/simple;
	bh=KljzhEINbuB2Omdwc/HSpviQ7Totqq5KjdVxNPAaWEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C6xsi4evOWE1ztBqczolSpRPKaba3de0nZs++xaLNP7eNgnrh1wHszamKQNXJWZTOQvK23E8MChumU+jAKF4Hnyp3xuIvfS/N8HZcckk9pQtqyIq9A875mtY3134ci5w3dKo/lYv24HJEm36iX4/oZDOhUyqYdKfV8r4cjjvwxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVUBJSrh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVUBJSrh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C20C116C6;
	Thu,  5 Mar 2026 15:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772724747;
	bh=KljzhEINbuB2Omdwc/HSpviQ7Totqq5KjdVxNPAaWEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HVUBJSrhzoBz6u8EZgSQADIyp8xjzfkc9RHf5Jb6jHB4VfwRQpIm+8nRNFFs80myf
	 ljh8T9vmkRvyOTU49lEIkvyA2t8y+W+XAGTSNpuHwKOfJ7cQuPGK5FCaX/v9Sh+4oE
	 qA2+bkhIG/mcnKulyb+luXvgy4sSM8mQXirnI4jPMAx724EBje3se5iAlYCRaWchxp
	 5Dyx5KyjJ/OecZ/m7RI6hNg6f9tflein41VS2EY4ONYFd8AvbBjLTXQPnMpMFSNoZc
	 H9V5AAu9ZCvhr8XMk48DG1SFE13JTmNabEOjZE2CnfkQEIt5rmaeAo3a668OKvX8nH
	 XGHbxjrnN1utA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vyAgb-0000000HN8v-3gyP;
	Thu, 05 Mar 2026 16:32:25 +0100
Date: Thu, 5 Mar 2026 16:32:25 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 00/11] kernel-doc improvements
Message-ID: <aamhhBqINYYHj66v@foz.lan>
References: <cover.1772722474.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1772722474.git.mchehab+huawei@kernel.org>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Thu, Mar 05, 2026 at 04:16:07PM +0100, Mauro Carvalho Chehab wrote:
> Hi Jon,
> 
> This series contains some patches that were submitted originally
> on this /41 patch series:
> 
> 	https://patchew.org/linux/cover.1769867953.git.mchehab+huawei@kernel.org/fc6723d13b96db014eaf0f14354d8821ea2085b8.1769867954.git.mchehab+huawei@kernel.org/

Hi Jon,

Don't apply this one. It ends I lost something among all rebases this
series passed thoug on this patch:

    fcf10d80e7a5 ("docs: kdoc_output: use a more standard order for .TH on man pages")

I'll be sending a version 2 later after sorting things out.

-- 
Thanks,
Mauro
