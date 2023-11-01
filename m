Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B209EA6
	for <linux-doc@vger.kernel.org>; Wed,  1 Nov 2023 13:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tjeqgvQK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA6AC433C8;
	Wed,  1 Nov 2023 13:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698844147;
	bh=Vz7ysH7cNtXbCT5BC7mDROjCTpfVrCFSPMZSO5EqKLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tjeqgvQK/oLxdfX5EEKWcza3KCJBMGLhXGTeqA8Ly6fm2cGjUi+UYRJHgMMZLxgmd
	 4U9j/nT60wdjDJtvHWxe1/UgpRobNH+rJuGmJAgwDy9QMeuAsS44mJwZLhx0f2oHN6
	 AlsrQOlDedpsGAh8kmCc+lhCBwqFOORxzimODwRrpWjDhLv8kK8/gaQWXquvgeyGtr
	 PWKD0a5NHbQT4f+0ZYezPb5eAICeXNTVpLTXcblv8r+x984Yp7I4qPLkYRso9UwgKB
	 5C+o1+5KgHBTVN1Qttts6rfF8nIDMdfMSIv0NvS4IgIsR6HL95NtQ5UgyO8Ih5n9Ct
	 KVf3okKzS/Vhw==
Date: Wed, 1 Nov 2023 13:09:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Liam Girdwood <lgirdwood@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Tejun Heo <tj@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] regulator: core: Add option to prevent disabling unused
 regulators
Message-ID: <c1690b26-9004-4e5e-aa14-c61f679add12@sirena.org.uk>
References: <20231028102423.179400-1-javierm@redhat.com>
 <20231101045652.GA2897@thinkpad>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NoDpa3jvoxiVIWee"
Content-Disposition: inline
In-Reply-To: <20231101045652.GA2897@thinkpad>
X-Cookie: P-K4


--NoDpa3jvoxiVIWee
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 01, 2023 at 10:26:52AM +0530, Manivannan Sadhasivam wrote:

> On the other note, I'm wondering if we could use sync_state() for handling the
> regulator_init_complete() work. This would ensure that the regulators are only
> disabled when all the consumers are probed.

That assumes that everything defined in the DT both has a driver and has
the driver available for the currently running kernel neither of which
is a good assumption.

--NoDpa3jvoxiVIWee
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVCTewACgkQJNaLcl1U
h9DA+Af/ehW2mCrAxO2tgVL9SyRKQuTI6KLs0SUMuRpUZ9hZNCbwHAVnWktnP5K6
DlYJukivxKx3vTd3FgRoUMdEiX1YblU9yKgJP3SQk0492iGZGr+wcwXEpZ4+DJ/G
wEq55hS3KPbe1rWMIAu4yJx+mdc6sYl4ypckMyxy3CLUkCD8WSIdY+lLm1uVxAT/
c/cXcRYtrixUX//OtRcpWK1WeXNG4sudiobU6ZbHTFQe+11+pM7dd9l358kUEWhJ
V98Cr0NW4foqYSM6PbiLTTpMBj8B1gr6MPtLvB5QbhVs9OyNzapMNZ1VD99JCNCr
Gf43q9CWYaL9QWzfDq2wnujt66+NPw==
=pOwA
-----END PGP SIGNATURE-----

--NoDpa3jvoxiVIWee--
