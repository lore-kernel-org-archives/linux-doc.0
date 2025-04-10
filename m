Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC8D38F80
	for <linux-doc@vger.kernel.org>; Thu, 10 Apr 2025 08:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744273754; cv=none; b=rFGA6j4ZRx0YVTuCOwKW2K4WZvHy+TOFWORiQF6FPCGovcfgNkUeco3eAG5FjzKrnCBgJdJ1l7xkjla+DiMfLZRXNSUPhww9VDWyXgq+YMrAxzEg3xI9pwC8f+zHnjlx3FusTVk2BIKowaA9GyJ3PVYVvbPvzto1e0DsXxWSFDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744273754; c=relaxed/simple;
	bh=MU13KP2jXhhCbS8pE2+yOL0FWamUtQb4l9jOBIpfl2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U12S99w2k5QsFsKoM+WmPbze93JJLpGJFADXjK9WnysHQ73NBvNu550xlAYy8Z6HNHJY7buRJvbOy2P+5NEI+n8985pZmX+X9zcRAk5nexZN0x4QHBsQ+jLk6BZ42F78BBONQtNa5q0naknUVIhxplIBSabs9QaD9ls6poTo7Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uYGTyQUd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uYGTyQUd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCDEFC4CEE3;
	Thu, 10 Apr 2025 08:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744273753;
	bh=MU13KP2jXhhCbS8pE2+yOL0FWamUtQb4l9jOBIpfl2E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uYGTyQUdRgTa5dEvC9aJJk5acRsHBC0JFy+PawHzLEd+c0vT8OgceXnqI4yVFR88B
	 pObB7X8EYN8bHhx2b9SOQ9/Akn90r+8SumQb8G3LTU0gBlvB/3N21C9hibmkhT2QOT
	 CpFs3UFVpBFlT74jx4meFCLNa9cDeFafk4UbZ+IIbWaCkp6aD42PuszgsJDsUU7zz5
	 I33Cl62SgwRagwaT4LCYnovuI4DIvaSbrGIbgdK5BgD8gSc74mvOV7dlJDKlUfjEvU
	 h020o0fVEx2N5d6d1s0/rk/yXdVgiTM38v5typJJI2lQ0qBykpUbd+kZ+rqzpX+ZIT
	 VFsKwfGPn+2cg==
From: alexs@kernel.org
To: Yanteng Si <si.yanteng@linux.dev>
Cc: Alex Shi <alexs@kernel.org>,
	corbet@lwn.net,
	dzm91@hust.edu.cn,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 0/2] docs/zh_CN: add Chinese trans guide and change Yanteng's email
Date: Thu, 10 Apr 2025 16:28:55 +0800
Message-ID: <174427372387.9363.12501740983256131624.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743156287.git.si.yanteng@linux.dev>
References: <cover.1743156287.git.si.yanteng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Alex Shi <alexs@kernel.org>


On Fri, 28 Mar 2025 18:06:42 +0800, Yanteng Si wrote:
> v3:
> 
> Since Dongliang and Alex have put forward a lot of constructive
> comments and added some content to the chapters, they should be
> become Co-developers.
> 
> diff:
> 
> [...]

Applied, thanks!

[1/2] docs/zh_CN: Add how-to of Chinese translation
      commit: 4f0145e9ea41cc5d0f80b79a60ce39757d3b47d6
[2/2] MAINTAINERS: Change Yanteng's email address
      commit: 794056966da84f46679c970133f358733ea6d847

Best regards,
-- 
Alex Shi <alexs@kernel.org>
