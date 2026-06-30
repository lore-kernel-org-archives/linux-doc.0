Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D454D299927;
	Tue, 30 Jun 2026 05:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782795691; cv=none; b=Iq0LHK3SAM05EePUwgb7rCLyTegF6MjNRvoJ1sPI5gdJQ0f4eLhT3Rzfq4setnziWFOUN++CH0WcZfXvqZVnB+Wt9CpRf0Dk3s4Fbi0RfoefKQK1O/Gamv0pmqyo2RwV7e8Ebcfc9VyngVrzRcGIBtXtdDk4dCPEuz9FsOm4V1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782795691; c=relaxed/simple;
	bh=KWLEBGBAr6sBSUd+J6rAdu8SAIlMkxfT4Da5A5+rHo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ko4M/qXJ2sc0iRuD3555dI9LvUc+Dkq36YOePPEVsyEZhgNE+M7xbWJ5v/7dwzSqLSyY+ys0sRG+cvJKFybMJt0hoc/J1n43y9xXB0srVFrsN/3O+hljIKg5QgeXAif36F+maCQrT5OL6jmDrKBnWAyoBYoZ9AHmvcXb7tXuXNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T7Iid+ad; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T7Iid+ad"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359261F000E9;
	Tue, 30 Jun 2026 05:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782795690;
	bh=YDdwnU6Ex/2szvC5BHJYfoFm0nDcVTjoG8iKlrOM4dE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T7Iid+ad5OCuH4+rP9InWt41D8nkMYoJWjL36OsSwtNiUmSu6v8lmcW8nn5zWLstB
	 BjXcyfhklV/w0Kje6KR8W3whm4lUZhcyKtuDBDA5mTs45V0nWvDi6Tg691yEUZNtet
	 AN9zfZQ9wsH+q17QzITlNGv4W6DQxaiAtKV6weCwH7cnJx9pr2pD8F+duWAuheZojT
	 9rVHkS6/DBXz3tLnAKD3S2eX8mDVATTl34OMatoJ7DC/O5MmbdI66Nr7uowgBaz8UR
	 6XjJXsr8kK2xC667SsG/c82EXEaYi66IoGDV5ZDdtxgmMni6yRnXI4asft6blsM5CF
	 xvFmL73H72jhQ==
From: SJ Park <sj@kernel.org>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: SJ Park <sj@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH v2] docs: kernel-hacking: fix typo
Date: Mon, 29 Jun 2026 22:01:21 -0700
Message-ID: <20260630050121.153045-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260629152912.86500-2-manuelebner@mailbox.org>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 29 Jun 2026 17:29:13 +0200 Manuel Ebner <manuelebner@mailbox.org> wrote:

> 'GP_KERNEL' -> 'GFP_KERNEL'
> Remove trailing '`' without clear purpose

Nice catch!

> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
