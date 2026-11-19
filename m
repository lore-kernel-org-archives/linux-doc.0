Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087044;
	b=kMDqQBFzkKqsFOehSwmnUqu+dseKmgQDtR0UoRtinVO0OlYMpn/cavFappYkSoa+0Mlk
	 zB6zLjCPe3QRExwmzURM135YVjmRHgzYqObyEIQtlam6ZOx5Z5zw9o/cQ9Kwze1Xd8Q/M
	 FGccD9b02QE6hMS6A1EE76B81NIUPg0fvNlafbgr4mOcH4geJzD7Oe+g8wx+37eeotadP
	 hGYoOVJLrgcEqjtKTGqIiU2F6RwEm+dH/xNoLI+7A/m5C2nsvrd/SVeUTXorXn6NM6jxg
	 nsQcefs5HIjnLQIH5X486/nC+L+UN7Wx18USuSXc4nLJ9Y//efPWt1Q+8KUGXGpZKIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087044;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TG1nYNTcyHyUOWzd5MXIw5ZMjc5V360SZkt3R3ZKcZ0=;
	b=3qkx4RnF5viN+fYgMM77ZU4H37WwS0BsrSSvkDzCMaGpAYaXdNkfQScpH20XNLzGYy0u
	 mqC33dtNScnpIA1cTJkX2hA329XTdpvxZNB+BJljW0G/ftkO+W2q4bI1pLnPm81oAjMKO
	 T9gb6FoYL20FlN69ircaTXV8Df3k0x/Kc2wUfwsGHbaltM6LRoIIi/a96D+GbieAmPZEH
	 nhYZbTbePUUemPGFxbf8Thb5cSBh8Nj4k4N6f6yOG2j9lsEHGegnpIHkTwmnog3uDQE2k
	 I2eTP5lszc9HMgpD9Ec8qOWRGCYazCthZykZLd8KZuXqlbne9EJF/QThLnhKtNC0Isw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oy8Bv2ht;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2294606A320;
	Thu, 19 Nov 2026 11:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oy8Bv2ht
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AB501F000C8;
	Thu, 19 Nov 2026 11:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795087044;
	bh=TG1nYNTcyHyUOWzd5MXIw5ZMjc5V360SZkt3R3ZKcZ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Oy8Bv2ht8Z31GiXHlzXSp+X8i+LdKi+A80wBsB56MX4yrnfzRl6Vl4L8OlITkHEqp
	 9t9oEkYzCGYR27uioqP/4jUcusdffaFZdSe5GdlSAMu20ZQTSGlPFEuIiMekhTRHAG
	 RvTulDh+dz2/k/LpLKHWfPauRY9Q4RyOOLznMU8Ygr/EeOq3zypKD3I1++z+7EIt1r
	 8lV3s0YAQTwxkPoXgbVq+Pu1QQArC6iKTatyIKgFHYxmINrvnmnL0JfArsuymvAXSS
	 JiE1rhf0LzNCJ3e5ooQfRy4r5+iiwroEeLT3sSosXplwKH0ByzxGmd2K3p94pmkp3A
	 ecq21BmBr1mww==
From: Mike Rapoport <rppt@kernel.org>
To: pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	akpm@linux-foundation.org,
	Long Wei <longwei27@huawei.com>
Cc: Mike Rapoport <rppt@kernel.org>,
	graf@amazon.com,
	leitao@debian.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	linux-mm@kvack.org,
	kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hewenliang4@huawei.com
Subject: Re: [PATCH v3] kho: do not expose incoming sub-blob contents in debugfs
Date: Thu, 19 Nov 2026 13:17:07 +0200
Message-ID: <179508700586.361583.12491114908870226409.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119095937.826980-1-longwei27@huawei.com>
References: <20261119095937.826980-1-longwei27@huawei.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Mike Rapoport (Microsoft) <rppt@kernel.org>

On Thu, 19 Nov 2026 17:59:37 +0800, Long Wei wrote:
> Incoming sub-blob pages are owned by their consumers and have independent
> lifetimes.  Some consumers, such as LUO, restore and free their state in
> early_initcall, i.e. before kho_init() (fs_initcall) builds the debugfs
> view:
> 
>   early_initcall: luo_early_startup()
>                     -> kho_retrieve_subtree("LUO")
>                     -> kho_restore_free(luo_ser)   /* page is freed */
> 
> [...]

Applied to liveupdate-7.5 branch of liveupdate/linux.git tree, thanks!

[1/1] kho: do not expose incoming sub-blob contents in debugfs
      commit: bfc4b321d12e344627c1ee4977d6a0a084746d7e

tree: https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux
branch: liveupdate-7.5

--
Sincerely yours,
Mike.

