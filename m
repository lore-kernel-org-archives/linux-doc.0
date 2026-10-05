Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF30274641
	for <linux-doc@vger.kernel.org>; Mon,  5 Oct 2026 00:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791161404; cv=none; b=ODjwasNTqUxJXB61lWQdGMgQ9v/igLGbPtVRvjmSVnJukYx0kd3KjY9FyRgVq+OJ5BeVw2tm/Hf0oBXuNf63UpI94+D1/WeYuIsfYzMFIsKIOLARAlc+pf1ve6XSD75HHExd8/ngBxvUUmn42CBb9uWocI+YdDgDLG70dIpm/+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791161404; c=relaxed/simple;
	bh=jVO+opMO9xDS4b0Pc6ncBzOEnD1xiGDeJWyhxsyvdQ8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HGR9dLZYfXF+RiKZL0w2X2oQnt/6VGTNjqTahbAOO82tO0e4I2uCwVybAXOlZ1gIS2s6CPFWp4cJsx8IHFLuDoGXRv0m8l3VgkNLfFLLfCB3lnSeE6Nu/qlYEHM9i3xFAWJwq/GUoRLaEP+aN/AblwKJMHV4yz9ucfaUTmEV5D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m8SzlGG7; arc=none smtp.client-ip=74.125.82.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m8SzlGG7"
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34ef5fd7934so3746901eec.0
        for <linux-doc@vger.kernel.org>; Sun, 04 Oct 2026 17:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791161401; x=1791766201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ySj6lu9UuXmvvkd8ttoq1+5ahvzATFnReoUR5PJwQFo=;
        b=m8SzlGG7m9V6di+RE0VXr+p2Fh2GyvOId7t2J3HlOmQi+ZkRyDy0Ky5/X35MiScPfh
         PFKAhIbDwUfy11FbG7LQAHSs8tiYLaiqu5zbMPQZ4a0DoqR+lUplf2+EvX7fYzL7g3ZR
         I7PhqtZF6sabNTbbRxXVFxE+SqASJe/rmNmqsx2QMPSKEAX1WRZVu3/ZRj2ij8zRXzAV
         O2hogLaIYgvaDFK4Z5eC5N+Qlc1BvIIuGOlvxHSvgBE23rl4lsWPdEu+ZrVSU/Ulb+y7
         J/GtHRhD6J9Ldt4c3yNPR8MA6zv5AEnxknrg7FBgNFmVA+0IyjJ8pKpXU1iTPiAxfzj2
         1QmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791161401; x=1791766201;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ySj6lu9UuXmvvkd8ttoq1+5ahvzATFnReoUR5PJwQFo=;
        b=ZApvMYLQq4xtKS5U5ON0yvU032Q+diu0gFfWDyt6IwW+aX64GOjvSMydvGHhp5I3oh
         vLeg1Cg2G2g+4iZDN+1o5R3w1Wc5DlrM1eLSD0byTtiszhgQw5+BDuZozk4+u+QNdUgp
         HTxjgxRXWwFZDmpM2HBdpOnzjm1xskTf8zMA5NUw+R9fIHB4eGiJDW133dQhAzJfXKwa
         LgUrNyLCZLiG5Wu/rgAgQEeGENnmcpNiX3OJkgNtVbTfJOM5pNffFYavOGyN3ifrCAFG
         8Xwvkoy5aO61newl5PJs6oOqhngV9Jqi8sZEN3l00hKUQnsJ/OLlshpbgr1S8ddb3rbG
         8TXg==
X-Forwarded-Encrypted: i=1; AKwUvBwcAI6GWrtuf20GsJID3wBa7OZxl8hM7y97zowXGRr+YjwXTSOSDxO6W8GLCNnmP+ic6cNWK/exUf8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLivgXarr3l9UQhyIKmGY1By769Gqqe3wX/LsEnEfpaAUQ2t3i4
	PT65Kk5IRYkGhnx1Ja+qgcKlX2xh+UQsM6t+0OsvUr2LvR1rjudWlbuwAE6RQALMOiHbxH9GwlV
	6fp0+VrAgVrkG/mJXoBypWwGOJw==
X-Received: from dyuq28-n1.prod.google.com ([2002:a05:693c:66dc:10b0:342:4261:a048])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:e5cb:b0:34c:8c69:529d with SMTP id 5a478bee46e88-34f150d878dmr11643250eec.26.1791161401034;
 Sun, 04 Oct 2026 17:50:01 -0700 (PDT)
Date: Mon,  5 Oct 2026 00:49:06 +0000
In-Reply-To: <20261005004958.3603059-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261005004958.3603059-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261005004958.3603059-3-almasrymina@google.com>
Subject: [PATCH net-next v1 2/2] docs: netmem: document netmem and memory
 provider design principles
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Luigi Rizzo <lrizzo@google.com>, "=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=" <bjorn@kernel.org>, 
	Pavel Begunkov <asml.silence@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Add a Design Principles section to Documentation/networking/netmem.rst
covering the netmem_ref abstraction, the prohibition on direct
downcasting in callers, decoupling memory providers from net_iov,
decoupling net_iov from unreadability, delegating provider/type logic to
memory_provider_ops and netmem helpers, and the homogeneous skb fragment
memory type invariant.

Cc: Luigi Rizzo <lrizzo@google.com>
Cc: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
Cc: Stanislav Fomichev <sdf@fomichev.me>
Cc: Pavel Begunkov <asml.silence@gmail.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 Documentation/networking/netmem.rst | 46 +++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/networking/netmem.rst b/Documentation/networking=
/netmem.rst
index 217869d1108dd..57e52a947663d 100644
--- a/Documentation/networking/netmem.rst
+++ b/Documentation/networking/netmem.rst
@@ -19,6 +19,52 @@ Benefits of Netmem :
 * Simplified Development: Drivers interact with a consistent API,
   regardless of the underlying memory implementation.
=20
+Design Principles
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Memory providers (or the default ``page_pool`` allocator) allocate underly=
ing
+memory (``struct net_iov`` or ``struct page``), cast it to ``netmem_ref``,=
 and
+supply it to ``page_pool``. The ``page_pool``, drivers, and networking sta=
ck
+operate on ``netmem_ref`` as the abstract type. Existing ``page_pool`` API=
s
+that allocate or free ``struct page`` are legacy compatibility wrappers fo=
r
+drivers that do not yet support ``netmem_ref``. Code that is not yet
+``netmem``-aware should be converted to ``netmem_ref`` unless it will neve=
r
+need to support ``netmem``.
+
+1. **Operate on netmem_ref, do not downcast**: ``page_pool``, drivers, and=
 the
+   core networking stack should deal with ``netmem_ref`` rather than
+   ``struct net_iov`` or ``struct page``. Downcasting ``netmem_ref`` to
+   ``struct net_iov`` or ``struct page`` is not allowed unless a code path
+   strictly cannot function without knowing the underlying memory type (fo=
r
+   example, ``kmap_local_page()``). In those cases, to keep call sites sim=
ple,
+   add a ``netmem`` helper that performs the operation on behalf of the ca=
ller,
+   cleanly handles all ``net_iov`` and ``page`` cases, and returns an erro=
r if
+   the ``netmem`` type cannot support the requested operation.
+
+2. **Decouple memory providers from net_iov**: Memory providers are not li=
mited
+   to ``struct net_iov``. A memory provider that returns ``struct page``-b=
acked
+   ``netmem_ref``\ s to upper layers is allowed. Code must not assume that=
 using
+   a memory provider implies ``net_iov`` memory.
+
+3. **Decouple net_iov from unreadability**: ``struct net_iov`` is flexible=
 and
+   has no inherent restrictions. While current ``net_iov`` implementations=
 are
+   unreadable by the CPU, future readable ``net_iov`` implementations are
+   allowed. Code must not assume ``net_iov`` is unreadable; check readabil=
ity
+   via ``netmem_address()`` or ``skb_frags_readable()`` instead.
+
+4. **Delegate complexity to the lowest layer**: Each layer must respect it=
s
+   abstraction boundary. ``page_pool`` must not implement per-memory-provi=
der
+   custom logic in its main code; instead, it delegates provider-specific
+   handling to ``struct memory_provider_ops``. Similarly, core networking =
code
+   should avoid per-``netmem``-type branching and instead delegate operati=
ons
+   to ``netmem`` helpers that handle the underlying memory type.
+
+5. **Homogeneous skb fragment memory types**: An ``sk_buff``'s ``frags[]``=
 are
+   always backed by ``netmem_ref``\ s of the same memory type. Mixing frag=
ments
+   from different memory types within a single ``sk_buff`` is not allowed,
+   keeping ``sk_buff`` handling simple. Consequently, coalescing ``sk_buff=
``\ s
+   with different fragment memory types must not happen.
+
 Driver RX Requirements
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
--=20
2.56.0.rc1.315.gc6ed9934b7-goog

