Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92BF3DA5C5;
	Wed, 18 Mar 2026 14:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773843979; cv=none; b=sjFSzWqBz2l95mx6z4/Bky+RzpDxceWE/IxzVB7XAkkkFyE6ydeZhQFInAB60o9vt6Zth0qOquh9zNIVLTYdYeCpam2IreH3LNNnhTKvthhzvD3aTVRFu5JDJ4H4k71a0hN/cz91GdZ/lCeHxygaHk3RZf1OunKKGP8vOqTa89E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773843979; c=relaxed/simple;
	bh=54MuExlmgOYmBkPi+JrKM370m6Z9lu/j/7Lwg0YFvgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Im2y9tEIeeWBmTGI/DGqb1sJl83IvyVe0SlIlX+Ff8ni81nl5cVDvjWMJmm4D+i3lG8KXqvHU0xBW0IdqoRowXtVrrSzqWCMvK9mKMJfGlFxJVm38aXdLu+YYhlq5gIZDN/y1RrHhO9iQ43j6MCPnVEAnrSYdHD47Emyi/EZkS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P8twcLHE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P8twcLHE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97B9EC2BCB6;
	Wed, 18 Mar 2026 14:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773843979;
	bh=54MuExlmgOYmBkPi+JrKM370m6Z9lu/j/7Lwg0YFvgE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P8twcLHEV71fjZLtEBceWkBRaRUF9iEyLrnCL7XWJPZdWlHcc69HuP3axoDLhHXim
	 nRi61hPDDTBquEuWhmtCXST3qFuEaKeTfnVbLR1ZsTyd/7BvQHSpdPo6/M3Wjo7kx/
	 iCVaPNeGUWWY6Z32a/dIoIBs8RdL4RV39Eh8iTdlcx64w5OHjEa/1BcCkfd6tiUkXk
	 FuCLg7y8BTRrEzJQC3P8UQns5PFlrk5Pwz7QJxJASSy4X6Y3brhPQ8LJUckLr/ET5z
	 gGAf34QXpmEqwVyxNv6pMtWd7RLjoPi8sGgnUx0Mo8SNlw98N6uV5dzoKB8aS46Vgm
	 twRL3DdajaxVg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2rqj-00000004Hau-3ZeY;
	Wed, 18 Mar 2026 15:26:17 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 4/7] docs: tools: include kdoc_yaml_file at documentation
Date: Wed, 18 Mar 2026 15:26:08 +0100
Message-ID: <50504851fd75ca970df73f3ade06308baf6748a1.1773841456.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773841456.git.mchehab+huawei@kernel.org>
References: <cover.1773841456.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Add an autodoc entry for the new kdoc_yaml_file module.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/tools/kdoc_ancillary.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/tools/kdoc_ancillary.rst b/Documentation/tools/kdoc_ancillary.rst
index 85f3806a431a..249753744d11 100644
--- a/Documentation/tools/kdoc_ancillary.rst
+++ b/Documentation/tools/kdoc_ancillary.rst
@@ -53,3 +53,11 @@ Python version ancillary methods
    :members:
    :show-inheritance:
    :undoc-members:
+
+Write output on YAML file
+=========================
+
+.. automodule:: lib.python.kdoc.kdoc_yaml_file
+   :members:
+   :show-inheritance:
+   :undoc-members:
-- 
2.52.0

