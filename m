Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A400D37C110;
	Thu, 15 Jan 2026 12:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768479843; cv=none; b=T2ge2O9/SVMSXTOdg6K3n1q9odGuMHGeh5APobw47ZxXxPsqq7KIZvYEjgypBqQE3IiheAloL/H103yZS8BLzZ4dzFgBjJfkSQo3n9nVtMxSuiwAyb9Pia2Aj9FzmTZUPxOR2bpmouEH5qMYRWZidbuIYJU2CnKEQHA56n8n/Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768479843; c=relaxed/simple;
	bh=jKpKv0GlK75yhJQ2UoDEAD6HG0fU0oaVgZjXwQkWM+o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OaTgDqvjMGzzw0mvyqDqvnJPRQkDHgq+QO7jc6iSoAzqY5rvweMvOei0J5pD1KhVv+SAgyG+UZRmY70pmIep2wlMF/l4o0JfIQX+PzL6hSpeoCV/xe94mCuOPouxZt1pmG1LNxqfv5+U9UrM6vJtUQFfUR8SN4X/UvwyRRfIknY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LNXn6igk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNXn6igk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA97DC19422;
	Thu, 15 Jan 2026 12:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768479843;
	bh=jKpKv0GlK75yhJQ2UoDEAD6HG0fU0oaVgZjXwQkWM+o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LNXn6igklQDs7+joiQwsewfJWNW/n8ALA1toZRovcaECJ5qq+d7SxonhL/gMTm0ew
	 QyLwLLLwAod1bwGcxmFXuyZoMC1yQOsNGK4R8T6pwYtHcDWgiN7mPI/j3sVYKCAQ6g
	 C9yITJoGOuQWsqJrQVDG/RXjhSLcEO9yU13vkUjoDOEQLZvBdnhfbLENptZTMwdz+Q
	 b4kCzRJ7wAUdIQ8nEaDg34YeVaafqw7vc3t/0eAwV+6AUnTktoGIKP2wV+5YSTH09b
	 z5U9GZCuSlkY1EhvUSuYTlwkJzoWaoKNvyiVrD2+4zMeOl1YzmDBsmgRM31UoHfN75
	 Vjv0N7+5r1wGA==
Date: Thu, 15 Jan 2026 13:23:58 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>, Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH 0/2] Move kernel-doc to tools/docs
Message-ID: <20260115132358.017e6436@foz.lan>
In-Reply-To: <3237bd2e1397910708743dba2c7d80b2c8eecb0b@intel.com>
References: <20260114164146.532916-1-corbet@lwn.net>
	<813cd0b6-e23b-4571-91fa-224106d3ad54@infradead.org>
	<87zf6gt2ts.fsf@trenco.lwn.net>
	<20260114212558.1aeb1b17@foz.lan>
	<3237bd2e1397910708743dba2c7d80b2c8eecb0b@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 15 Jan 2026 12:33:10 +0200
Jani Nikula <jani.nikula@linux.intel.com> escreveu:

> On Wed, 14 Jan 2026, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > Em Wed, 14 Jan 2026 12:24:31 -0700
> > Jonathan Corbet <corbet@lwn.net> escreveu:
> >  
> >> Randy Dunlap <rdunlap@infradead.org> writes:
> >>   
> >> > I do many of these on a regular basis:
> >> >
> >> > $ ./scripts/kernel-doc -none -Wall <path_to_source_file>
> >> >
> >> > Will I still be able to do that (by using ./tools/doc/kernel-doc ...)?    
> >> 
> >> Yes.  The tool moves, but its functionality remains unchanged.  
> >
> > That's actually a good point: should we preserve a link on scripts
> > pointing to ../tools/doc/kernel-doc? I suspect that a change like
> > that could break some machinery on several CI tools and scripts
> > out there. If so, it could be useful to keep a link - at least for
> > a couple of kernel releases.  
> 
> I think the tool source should be called kernel_doc.py or something, and
> scripts/kernel-doc should be a script running the former.

Works for me.

> In regular python projects the script would be generated based on
> pyproject.toml or something, but regardless the source file name would
> adhere to PEP requirements.

Agreed.

> Additionally, the kernel-doc source could be a package under
> tools/lib/python, with __main__.py so you could run it using the package
> name 'python3 -m foo' style.

This is where we diverge: all the code needed to produce docs are
already inside modules which are called directly via Sphinx extension. 

So, I can't see an advantage on moving main to __main__.py.


Thanks,
Mauro
