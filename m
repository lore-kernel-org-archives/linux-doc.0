Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBC92376E
	for <linux-doc@vger.kernel.org>; Mon, 13 Nov 2023 19:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/22qNo4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E3EBC433C8;
	Mon, 13 Nov 2023 19:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699904435;
	bh=nx7dxtYmjGRBmy753Kk0BhkvpRXqbIqSxx3MC3Ik8I8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=T/22qNo46KR1wKRMTgq3Y4HCmF10vBRyry/NV7lYdqiNZ26YUU6WfdC63ZNiIvAMN
	 lHdSYG9rrViPgc5ZhSfWx0eRjk0dNv/qklW8QjRImxLo+MGweTuD1HmkB2cW8QGL17
	 QkF8DU8K1gy5/jbiIC1e99b4OXi1MX5B2AsUiMWEisYmFF8a696/js4AoGbFjQc2aN
	 Wi1ZMbTOJyqayvShm75TGkGo5JFD+LoNs0sse5rPlccij1k/qO8oD0Fzlo6P5Db/H5
	 WEqwCaJqpwKuhnPNT9zfv1teJ3YZOcZAzFqPmKeO3zABQFuIQ0ixmmS12KeWLIcVjx
	 4HgJ14r4LjMqA==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Liam Girdwood <lgirdwood@gmail.com>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 "Steven Rostedt (Google)" <rostedt@goodmis.org>, Tejun Heo <tj@kernel.org>, 
 linux-doc@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
In-Reply-To: <20231107190926.1185326-1-javierm@redhat.com>
References: <20231107190926.1185326-1-javierm@redhat.com>
Subject: Re: [PATCH v2] regulator: core: Add option to prevent disabling
 unused regulators
Message-Id: <169990443197.3294075.4873136953876130203.b4-ty@kernel.org>
Date: Mon, 13 Nov 2023 19:40:31 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Tue, 07 Nov 2023 20:09:18 +0100, Javier Martinez Canillas wrote:
> This may be useful for debugging and develompent purposes, when there are
> drivers that depend on regulators to be enabled but do not request them.
> 
> It is inspired from the clk_ignore_unused and pd_ignore_unused parameters,
> that are used to keep firmware-enabled clocks and power domains on even if
> these are not used by drivers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: core: Add option to prevent disabling unused regulators
      commit: c986968fe92f20f2db26fa6bce27795b2e9ebe22

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

