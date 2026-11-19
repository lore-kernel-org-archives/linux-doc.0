Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097154;
	b=aFFzrtGAJqW9ndIEDc8omIfnZsh8EuZ6Ed5H3qIfGgvMQMb68z4YwVwLS8Ky5DVEVxDk
	 tHFtKcopHApwzjQHYjy1CROCw4PtHdt/oph1JcPmhNaO4aEh2d8bTIGAzEleSjLHEFWoQ
	 BIbqugj/aYxPrTJzgb0UlJGdy+UncROtOiyZxZQ9QVd3fxWBXbwZH3trCpleC0amNMAM1
	 Tdk73vC7bLNmD/QoXG6TVcjRODrI7zsGLqSe++eMh9NnO/1Zd4NzEhsfeg0Gef9pxoPSJ
	 w5j2Kqxw/7PekPqe8ByW++BfTSjXrx29W2XZ0p7BFIRpuyc9yZi4UsrgA6eDiA5cYwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097154;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=aHQcFrSu1zrwESv/0PJtDv7WBpcVadSNqc4S4zD+4uo=;
	b=Jdlv4jukPFqtUZzoHU5GGBRQHsRTbzX2aEUsu+9EZbPXGODCi/ie+kXjWvbdx1+Y0jDk
	 Ro98d79Ypisi0j1LglzmN/F8YazzRbuxFQi3v7tLlV6lfiHCF/meBHWuw9sk3R7ADaDgs
	 I8uEamhnvbPGOB9QGS6dXCZrgFdd3E9psplbEu2ZiaLFrgUcA9lt7XVWQBt6qjJOEJ972
	 4wPpxPorJTl/M5YludW6uJLJTzRvi+pY93hKpB2UrimXESRQZvEbcIp8t7cz1UGQO/1e6
	 jDY1RWK7nYEWJJRU06baNpHjJ9AkxKpSUpZSwNAqCLlqYx4pNqArhT9IFn16HLAzTYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iavo6JLx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA01606A325;
	Thu, 19 Nov 2026 14:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iavo6JLx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C00C1F000C4;
	Thu, 19 Nov 2026 14:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795097154;
	bh=aHQcFrSu1zrwESv/0PJtDv7WBpcVadSNqc4S4zD+4uo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Iavo6JLxQAXP+EmZUlJ0bXZu93F9riuZuMlArISGhpINH/0gFgxqYzse3LCxXl7fB
	 25pUADt6PGTm1DERIS5RebS0OLqBNQpEFNMJ/kd0/mnTBOdxGNGmw0p7Jt7wbJN7kt
	 w4rM+yTdRBD6XyJ8cg3KyfJWjrXlAi8/t7YWPPo9k52EmmRVTQ32I/26cz3Y/0QdF2
	 +OeqbMTm0yRey0bxHIS9SdwF5+NCXOQddHOUKh78z7UZ2+6uQbvNiP4DLQqHoP/VGS
	 +8bfe/lL6gid3GS9QngnEgKQdIf5kaAjT0bx3E76FOwuWk1NF7oikDjQ5QhfRmE6rL
	 /wuDz8ZHM1q3A==
From: Christian Brauner <brauner@kernel.org>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Documentation <linux-doc@vger.kernel.org>, 
 Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Al Viro <viro@zeniv.linux.org.uk>, 
 NeilBrown <neil@brown.name>, Eric Sandeen <sandeen@redhat.com>
In-Reply-To: <20261117035004.12262-1-bagasdotme@gmail.com>
References: <20261117035004.12262-1-bagasdotme@gmail.com>
Subject: Re: [PATCH] fs: porting: Retitle
Message-Id: <20261119-klargemacht-vertagen-dazuverdienen-b6c2f5919943@brauner>
Date: Thu, 19 Nov 2026 15:05:50 +0100
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-04696

On Tue, 17 Nov 2026 10:50:04 +0700, Bagas Sanjaya wrote:
> porting.rst is a technical reference on what changes to the fs subsystem
> (since 2.5.0), not the whole kernel as the existing title may imply.
> 
> Retitle it.

Applied to the vfs-7.5.misc branch of the vfs/vfs.git tree.
Patches in the vfs-7.5.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-7.5.misc

[1/1] fs: porting: Retitle
      https://git.kernel.org/vfs/vfs/c/82718015e2f1

