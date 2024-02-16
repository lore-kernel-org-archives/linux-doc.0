Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7064228E23;
	Fri, 16 Feb 2024 16:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708100388; cv=none; b=i/XqjXZEVDFQ5NQoaUkZ5ZLQIXH3y5ppf4s10o2MfTFwRJ1j95fuVQ9Yw+WWBrNJzsztoqysNy7NzvheAViUNezqjbrqOBjz5PzWz6YlLi0MUR4/Lf/Yn4hllC9LPYJcpAgjFX8EEEx1dretYqo0RD+Sszz9ZGCi+NImTVN6QkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708100388; c=relaxed/simple;
	bh=z1doxho28WvuEFUFHtMx7FRZ5WVb05cgN25WfGEJ6TA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TJ11IBtOH8EQhCPpcjHkRobg6v6YCIYljZDL7yTRQI7LA3q84dsqHiuAXSYcGKzvQuClAiSlWfzz0e/NczQh+TSIczCHN7GEDMOsg7Y2doh/xG8/kRoY5uPOG519Y3UFLG7O2yhUEdGsmqlDZxjXsFv3ihr/MOKplLvjCVtXIBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfoG3gxp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfoG3gxp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A84C433C7;
	Fri, 16 Feb 2024 16:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708100388;
	bh=z1doxho28WvuEFUFHtMx7FRZ5WVb05cgN25WfGEJ6TA=;
	h=From:To:Cc:Subject:Date:From;
	b=cfoG3gxp297QjKR6XGzJ/eNyOwHUIJxXsvj7C5cw30eRc+qy/YS+WwWt91Af1GnQK
	 CSTann89YP5twvpYH1PddAed2X7GN5aZfxoQpkRrojiSWd+jn3M6ZkLQqegbDtIATx
	 PwKBp+5vvUGX2vclDuzBLQ+53XBlE/d69sDoYEwF8xzUsbcZugv38uCSTszlme/lgC
	 G/k32/wcGZzKeGWo2bfodHTXoEzEDCAGsXk01R7K+8mtMF8CzmM0K+NYZk2mMQPcUl
	 qMC6jbUtuUxeh+I5WLYfzUIENUlwboJYjP1QwjnLdtf636JGBvYkbaZrmIjcL/a4LV
	 jh9EB3wodI/pQ==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	Jakub Kicinski <kuba@kernel.org>,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH net] docs: netdev: update the link to the CI repo
Date: Fri, 16 Feb 2024 08:19:45 -0800
Message-ID: <20240216161945.2208842-1-kuba@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Netronome graciously transferred the original NIPA repo
to our new netdev umbrella org. Link to that instead of
my private fork.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: corbet@lwn.net
CC: linux-doc@vger.kernel.org
---
 Documentation/process/maintainer-netdev.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/maintainer-netdev.rst b/Documentation/process/maintainer-netdev.rst
index 84ee60fceef2..fd96e4a3cef9 100644
--- a/Documentation/process/maintainer-netdev.rst
+++ b/Documentation/process/maintainer-netdev.rst
@@ -431,7 +431,7 @@ patchwork checks
 Checks in patchwork are mostly simple wrappers around existing kernel
 scripts, the sources are available at:
 
-https://github.com/kuba-moo/nipa/tree/master/tests
+https://github.com/linux-netdev/nipa/tree/master/tests
 
 **Do not** post your patches just to run them through the checks.
 You must ensure that your patches are ready by testing them locally
-- 
2.43.0

