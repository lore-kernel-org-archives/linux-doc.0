Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43175EDE;
	Wed, 18 Oct 2023 01:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LAvdX0kX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BCDF9C433C9;
	Wed, 18 Oct 2023 01:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697591422;
	bh=KpcGS0wIZInDimOZ+8Z3z7jeLbSMZ1iFtweWYeARmqw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LAvdX0kXXzbvKIwFTQhZUe6r8VIMxwJz9bx5lsg9yK4UiVXGYDxqVq/EyISW/FeLq
	 LSfLVUFeKHvtk1osinvyNdO9qPgCS1PM6MeDz4RwYA42tn0LpO6V56SCAGb4x7Yynz
	 jLo3ofZ6+l5/ZTNz3ZtVXkGt/6BSPc1O1JxruUO6PzWRWVDrHJhDddIcU9wbkr/vIS
	 sZ4NqL/eOxRFncT+/gFfBb3f62bfpqgAH6mkHYp6CvmEZhXxF0Bn2O4YZ4BeENxHM5
	 I5JqyMH2zKUKSFOtH6KP+SaBRhOu5l2x6twYlnK+PwFiFzX/mbcPRpSi3k4xxdTVZa
	 JqDz64bH0wEJQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A27D5E4E9BC;
	Wed, 18 Oct 2023 01:10:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] docs: netlink: clean up after deprecating version
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <169759142265.24973.8584317282955936096.git-patchwork-notify@kernel.org>
Date: Wed, 18 Oct 2023 01:10:22 +0000
References: <20231016214540.1822392-1-kuba@kernel.org>
In-Reply-To: <20231016214540.1822392-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, jiri@resnulli.us, linux-doc@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 16 Oct 2023 14:45:40 -0700 you wrote:
> Jiri moved version to legacy specs in commit 0f07415ebb78 ("netlink:
> specs: don't allow version to be specified for genetlink").
> Update the documentation.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> v2:
>  - s/Gobals/Globals/
>  - breaking changes are -> compatibility breaking changes are
>    I think it's plural but the omission of "compatibility" made it confusing
>  - not changing the wording to "should never be used", I prefer existing
> v1: https://lore.kernel.org/all/20231012154315.587383-1-kuba@kernel.org/
> 
> [...]

Here is the summary with links:
  - [net-next,v2] docs: netlink: clean up after deprecating version
    https://git.kernel.org/netdev/net-next/c/5294df643ba6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


