Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545062C21F1
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 01:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778809790; cv=none; b=M68tbporbt/D3FvCaO3XH6dRH+xm6zF9xJLWVdWJX3nqWo0rZ9rNST2Xg2tksF7dd8UKM4BN/slOpq9GAjwSbrwkyEAhxZJUm4s9sCEOnpBaQj5DgvI3q2AYXBB2D7VKEsGr2F597jS9fq8uO8QLZmWpF4+af7uSdMoVKmRsrlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778809790; c=relaxed/simple;
	bh=aq8Y4HDWvTzLSxNL1nzXPObwRzU19vm35otQrWKzGwM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AUacPF+qZaD6uQ0BAkAtittfABm/fm4TOA4Lv4/fgtPtReorE09gIQS3B56aW1wU8dZWXOv+Ihm7soD6yENZ3H1EndQw6u+p1BF1Xt5VG3+GglpBMJbl4V8d2STU6kwbNCjmBI+QP22oukIMO25ATzG6YubV7olxFegqetBIYEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YsLbToBR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YsLbToBR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C914EC2BCB3;
	Fri, 15 May 2026 01:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778809789;
	bh=aq8Y4HDWvTzLSxNL1nzXPObwRzU19vm35otQrWKzGwM=;
	h=Date:From:To:Cc:Subject:From;
	b=YsLbToBRP5lMzV0z9OXJHbczpCO7LjZZvY7gjv+n+BNd1ip7EhsoqxKXfqWUXYEQY
	 5aBI1YIdZfjPwaMdovGRY3NhA9u0qpuYc9bo1bSMiJeBOnUGNtMa+xGzCTD1QvfivT
	 adG/Fobm+W/mUdG0WPiZReEjjvoJfgYGe5jmqFg6la8riRFQGTWYbScVVkpptdhz3f
	 8eW9MkmrmqF8eecZ5JxgtnTnaOsnOFtnJgTl2a9C7dv4OsaLd8w0htD2c5YZLdLpRC
	 GanhcCTgEGNIbI/O4/1/igsv8pSBQPI0avUh5FBJ48j0q8HNIJRXw5yUHe+S3ORV5+
	 pSN19JfFlbEpg==
Date: Thu, 14 May 2026 18:49:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-doc@vger.kernel.org
Subject: kernel-doc no longer warns about leftover argument doc?
Message-ID: <20260514184948.3fa705e1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi!

Looks like the new python kernel-doc does not warn when there are
stray arguments in function kdoc. Eg

/**                                                                             
 * ksz_wol_pre_shutdown - Prepares the switch device for shutdown while         
 *                        considering Wake-on-LAN (WoL) settings.               
 * @dev: The switch device structure.                                           
 * @wol_enabled: Pointer to a boolean which will be set to true if WoL is       
 *               enabled on any port.                                           
 *                                                                              
 * This function prepares the switch device for a safe shutdown while taking    
 * into account the Wake-on-LAN (WoL) settings on the user ports. It updates    
 * the wol_enabled flag accordingly to reflect whether WoL is active on any     
 * port.                                                                        
 */                                                                             
static void ksz_wol_pre_shutdown(struct ksz_device *dev)


AIs seem to catch it but that's not ideal..
