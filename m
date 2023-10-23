Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EACA3D
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 02:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="SduO33Z2"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 937B513E;
	Sun, 22 Oct 2023 19:39:06 -0700 (PDT)
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 445E460A;
	Mon, 23 Oct 2023 02:39:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 445E460A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1698028746; bh=349s1fTyTzvEv7PXdqKIzZTIMuQ6igSkQHAALwkx+Uo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SduO33Z2ChSY+cy9coi29Yv2WEjsbGSiS9sEsAvY4BH/IBZxl0WcLy8FlITachHLe
	 DSDcJY5e9tKkXC6GxV+4zEnEG07/qq0Q+sSPX9B47hraSgF3ibUml+S3lHlGaoblfp
	 Dz6gASMZYhevGhPDQh4rSw6ldfC5/OzQhJJ0GpOKvE5TFes9e7N7jUNijMEtAb8cWz
	 a3RlrNbet0lLvrGOWoTh7VUJzWp0Y3ZsUNCmunL88rEmEaKU7DJFvxcFWQ4ZPB/fh1
	 t2BG5UNM1yRaJ1BsSN6bzdWx74Goc6lTeRhQjq+IK9AN0319XBWFDASJ2R7aYMKdBE
	 xWdb+uJ9pl/hg==
From: Jonathan Corbet <corbet@lwn.net>
To: Vegard Nossum <vegard.nossum@oracle.com>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Vegard Nossum
 <vegard.nossum@oracle.com>
Subject: Re: [PATCH] docs: doc-guide: mention 'make refcheckdocs'
In-Reply-To: <20231022184910.919201-1-vegard.nossum@oracle.com>
References: <20231022184910.919201-1-vegard.nossum@oracle.com>
Date: Sun, 22 Oct 2023 20:39:05 -0600
Message-ID: <87il6yjc52.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Vegard Nossum <vegard.nossum@oracle.com> writes:

> Add this to the section on fixing warnings.
>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  Documentation/doc-guide/contributing.rst | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/doc-guide/contributing.rst b/Documentation/doc-guide/contributing.rst
> index d4793826ad9a..662c7a840cd5 100644
> --- a/Documentation/doc-guide/contributing.rst
> +++ b/Documentation/doc-guide/contributing.rst
> @@ -138,6 +138,10 @@ times, but it's highly important.  If we can actually eliminate warnings
>  from the documentation build, then we can start expecting developers to
>  avoid adding new ones.
>  
> +In addition to warnings from the regular documentation build, you can also
> +run ``make refcheckdocs`` to find references to nonexistent documentation
> +files.

Applied, thanks.

jon
