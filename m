Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958AC19BC2
	for <linux-doc@vger.kernel.org>; Thu,  2 Nov 2023 14:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WY7kqFjI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81BA1C433C7;
	Thu,  2 Nov 2023 14:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698934166;
	bh=cLVgKGsvd2J+4hBR/jBxwJpQHA9W6KN+s9cJCdjKm2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WY7kqFjIuWjVZdXz6GwECmIQKQHr6nV5MTCwVdNQ7hMgNwoycBvDXbfpy1lQuRM+q
	 vy84HxgPTqe4cdKt7X7K8ATCfePd4jE6yRhiIee2rvvzqvhmUSUFFz2OJiF4GFxPBo
	 wqW4/dXqo74dpAyx7v0cBqStElVPP1+HTIdFcbLo=
Date: Thu, 2 Nov 2023 15:09:21 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Akira Yokosawa <akiyks@gmail.com>,
	Stanislav Fomichev <sdf@google.com>,
	David Vernet <void@manifault.com>, Miguel Ojeda <ojeda@kernel.org>,
	James Seo <james@equiv.tech>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Carlos Bilbao <carlos.bilbao@amd.com>, linux-spdx@vger.kernel.org,
	Richard Fontana <rfontana@redhat.com>
Subject: Re: [PATCH RFC RESEND 1/4] LICENSES: Add SIL Open Font License 1.1
Message-ID: <2023110211-absolute-backfire-b6a0@gregkh>
References: <20231102123225.32768-1-bagasdotme@gmail.com>
 <20231102123225.32768-2-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231102123225.32768-2-bagasdotme@gmail.com>

On Thu, Nov 02, 2023 at 07:32:19PM +0700, Bagas Sanjaya wrote:
> Add the license text along with appropriate tags for reference and
> tooling. The text is taken from the text as distributed in Google
> Fonts's zip files.
> 
> As the license itself may or may note be compatible with GPLv2,
> let's take on the err side and require combining it with
> GPL-compatible licenses when using the license.
> 
> Cc: linux-spdx@vger.kernel.org
> Cc: Richard Fontana <rfontana@redhat.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  LICENSES/dual/OFL-1.1 | 107 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 LICENSES/dual/OFL-1.1

Same comment as made before here:
	https://lore.kernel.org/all/2023110222-renewed-monologue-008e@gregkh/
